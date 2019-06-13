//
// Created by ME on 06.05.2019.
//

#include "IObjectDrawer.h"
#include "ConvertedLua.h"
#include "ConvertedLuaInterface.h"
#include "LuaUtil.h"
#include "lua/lua.hpp"
#include <vector>
#include <iostream>
#include <S100RulesParser/private/S101Primitives.h>

using std::min;

IObjectDrawer *pDrawerMy;
std::vector<int> features_mylua;

extern "C" {

S101RULES_API int LuaHost2_getDatasetSize(const char *dataset_name) {
    return features_mylua.size();
}

void *toVoid2(const IAttrContainer *ptr) {
    return (void *) ptr;
}

const IAttrContainer *fromVoid2(void *ptr) {
    return static_cast<const IAttrContainer *> (ptr);
}

S101RULES_API void LuaHost2_getDatasetContents(const char *dataset_name, CFeature *data, const int max_features) {
    int total = min(max_features, (int) features_mylua.size());
    const auto &feats_by_id = pDrawerMy->GetCatalogue().feats_by_id;
    for (int i = 0; i < total; i++) { // TODO
        int id = features_mylua[i];
        const IFeature &feature = pDrawerMy->GetFeature(id);
        data[i].id = id;
        data[i].clazz = feature.GetClass();
        data[i].Primitive = feature.GetPermittedPrimitives();
        data[i].attr_node_ptr = toVoid2(&feature);
    }
}

S101RULES_API void LuaHost2_getDatasetContext(CContext *context) {
    const auto &drawerContext = pDrawerMy->GetContext();
    context->SIMPLIFIED_POINTS = drawerContext.IsSimplifiedPoints();
    context->PLAIN_BOUNDARIES = !drawerContext.IsSymbolizedAreas();
    context->SHALLOW_PATTERN = drawerContext.GetShallowPattern();
    context->TWO_SHADES = !drawerContext.GetFourShades();

    context->DEEP_CONTOUR = drawerContext.GetDeepContour();
    context->SAFETY_CONTOUR = drawerContext.GetSafetyContour();
    context->SAFETY_DEPTH = drawerContext.GetSafetyDepth();
    context->SHALLOW_CONTOUR = drawerContext.GetShallowContour();
}

S101RULES_API int LuaHost2_getIntegerAttributes(void *attr_node_ptr, const char *attr_name, int *data, int size) {
    auto attr_node = fromVoid2(attr_node_ptr);
    int total = attr_node->GetIntEnumAttrCount(attr_name);
    for (int i = 1; i <= min(total, size); i++) {
        data[i] = attr_node->GetIntEnumAttr(attr_name, i);
    }
    return total;
}

S101RULES_API int LuaHost2_getRealAttributes(void *attr_node_ptr, const char *attr_name, double *data, int size) {
    auto attr_node = fromVoid2(attr_node_ptr);
    int total = attr_node->CheckAttrExists(attr_name);
    total = min(total, 1);
    if (total)
        attr_node->GetRealAttrByID(attr_name, data + 1);
    return total;
}

S101RULES_API int LuaHost2_getBoolAttributes(void *attr_node_ptr, const char *attr_name, bool *data, int size) {
    auto attr_node = fromVoid2(attr_node_ptr);
    int total = attr_node->CheckAttrExists(attr_name);
    total = min(total, 1);
    if (total)
        data[1] = attr_node->GetBoolAttr(attr_name);
    return total;
}

S101RULES_API int LuaHost2_getTextAttributes(void *attr_node_ptr, const char *attr_name, const char **data, int size) {
    auto attr_node = fromVoid2(attr_node_ptr);
    int total = attr_node->CheckAttrExists(attr_name);
    total = min(total, 1);
    if (total)
        data[1] = attr_node->GetStringAttr(attr_name);
    return total;
}

S101RULES_API int LuaHost2_getComplexAttributes(void *attr_node_ptr, const char *attr_name, void **data, int size) {
    auto attr_node = fromVoid2(attr_node_ptr);
    int total = attr_node->GetComplexAttrCount(attr_name);
    for (int i = 1; i <= min(total, size); i++) {
        data[i] = toVoid2(attr_node->GetComplexAttr(attr_name, i));
    }
    return total;
}

S101RULES_API const char *LuaHost2_getPrimitive(int feature_id) {
    return pDrawerMy->GetFeature(feature_id).GetPermittedPrimitives();
}

S101RULES_API void LuaHost2_AddFunction(int drawing_priority, int viewing_group,
                                        struct S101ObjectDrawerParam *param, int operation, int index_feature) {
    pDrawerMy->AddFunction(drawing_priority, viewing_group, *param, operation, index_feature);
}

}

lua_State *prepareMyState() {
    lua_State *state = luaL_newstate();
    luaL_openlibs(state);

    addLuaPath(state, R"(src\ConvertedLuaPortrayal\Lua\?.lua)");

    luaL_loadfile(state, R"(src\ConvertedLuaPortrayal\Lua\PortrayalMain.lua)");
    int res;
    res = lua_pcall(state, 0, 0, 0);
    if (res != 0) {
        const char *string = lua_tostring(state, -1);
        std::cout << "My Lua load error: " << string << "\n";
    }
    return state;
}

void setupConv(TestObjectDrawer &drawer, const std::string &prefix, const std::vector<int> &features) {
    pDrawerMy = static_cast<IObjectDrawer *>(&drawer);

    if (features.empty()) {
        drawer.RunOnAllFeatures([](IObjectDrawer *drawer1, int clazz, int index) {
            features_mylua.push_back(index);
        }, prefix);
    } else {
        drawer.drawCalls = 0;
        features_mylua = features;
    }
}

void teardownConv() {
    pDrawerMy = nullptr;
    features_mylua.clear();
}

int
runMyLuaLong(TestObjectDrawer &drawer, const std::string &prefix, int runs, const std::vector<int> &features) {
    setupConv(drawer, prefix, features);
    lua_State *L = prepareMyState();

    runPortrayalMainTimes(L, std::max(2, runs / 5));
    timer t("My lua");
    runPortrayalMainTimes(L, runs);
    int time = t.stop();
    lua_close(L);

    teardownConv();
    return time;
}

int
runMyLuaShort(TestObjectDrawer &drawer, const std::string &prefix, int runs, const std::vector<int> &features) {
    setupConv(drawer, prefix, features);

    int ttl = 0;
    for (int iter = 0; iter <= runs; iter += 5) {
        lua_State *L = prepareMyState();
        runPortrayalMainTimes(L, 1);
        timer t("My lua");
        runPortrayalMainTimes(L, 5);
        ttl += t.stop();
        lua_close(L);
    }

    teardownConv();
    return ttl;
}

int runMyLuaCold(TestObjectDrawer &drawer, const std::string &prefix, int runs, const std::vector<int> &features) {
    setupConv(drawer, prefix, features);

    int ttl = 0;
    for (int iter = 0; iter <= runs; iter++) {
        lua_State *L = prepareMyState();
        lua_getglobal(L, "getFeatures");
        lua_pushstring(L, "testset");
        int res = lua_pcall(L, 1, 0, 0);
        if (res != 0) {
            const char *err = lua_tostring(L, -1);
            std::cerr << err << "\n";
            return 0;
        }
        timer t("My lua");
        runPortrayalMainTimes(L, 1);
        ttl += t.stop();
        lua_close(L);
    }

    teardownConv();
    return ttl;
}


int runMyLuaCreate(TestObjectDrawer &drawer, const std::string &prefix, int runs, const std::vector<int> &features) {
    setupConv(drawer, prefix, features);

    int ttl = 0;
    for (int iter = 0; iter <= runs; iter++) {
        lua_State *L = prepareMyState();
        timer t("My lua");
        lua_getglobal(L, "getFeatures");
        lua_pushstring(L, "testset");
        int res = lua_pcall(L, 1, 0, 0);
        if (res != 0) {
            const char *err = lua_tostring(L, -1);
            std::cerr << err << "\n";
            return -0;
        }
        ttl += t.stop();
        lua_close(L);
    }

    teardownConv();
    return ttl;
}