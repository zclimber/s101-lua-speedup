//
// Created by ME on 06.05.2019.
//

#include "IObjectDrawer.h"
#include "OptimizedLua.h"
#include "OptimizedLuaInterface.h"
#include "LuaUtil.h"
#include "lua/lua.hpp"
#include <vector>
#include <iostream>
#include <cstring>
#include <S100RulesParser/private/S101Primitives.h>

using std::min;

IObjectDrawer *pDrawer;
std::vector<int> features_modlua;

extern "C" {

S101RULES_API int LuaHost_getDatasetSize(const char *dataset_name) {
    return features_modlua.size();
}

void *toVoid(const IAttrContainer *ptr) {
    return (void *) ptr;
}

const IAttrContainer *fromVoid(void *ptr) {
    return static_cast<const IAttrContainer *> (ptr);
}

S101RULES_API void LuaHost_getDatasetContents(const char *dataset_name, CFeature *data, const int max_features) {
    int total = min(max_features, (int) features_modlua.size());
    const auto &feats_by_id = pDrawer->GetCatalogue().feats_by_id;
    for (int i = 0; i < total; i++) { // TODO
        int id = features_modlua[i];
        const IFeature &feature = pDrawer->GetFeature(id);
        data[i].id = id;
        data[i].SpatialAssociation = feature.GetSpatialId();
        data[i].clazz = feature.GetClass();
        data[i].primitive = feature.GetSpatialId().PrimitiveNumber();
        data[i].attr_node_ptr = toVoid(&feature);
    }
}

S101RULES_API void LuaHost_getDatasetContext(CContext *context) {
    const auto &drawerContext = pDrawer->GetContext();
    context->SIMPLIFIED_POINTS = drawerContext.IsSimplifiedPoints();
    context->PLAIN_BOUNDARIES = !drawerContext.IsSymbolizedAreas();
    context->SHALLOW_PATTERN = drawerContext.GetShallowPattern();
    context->TWO_SHADES = !drawerContext.GetFourShades();

    context->DEEP_CONTOUR = drawerContext.GetDeepContour();
    context->SAFETY_CONTOUR = drawerContext.GetSafetyContour();
    context->SAFETY_DEPTH = drawerContext.GetSafetyDepth();
    context->SHALLOW_CONTOUR = drawerContext.GetShallowContour();
}

S101RULES_API void LuaHost_getSpatial(struct CSpatial *data, int id) {
    auto &s = pDrawer->GetSpatial(id);
    data->SpatialID = s.id;
    data->scale_minimum = data->scale_minimum;
    data->scale_maximum = data->scale_maximum;
    data->points_count = data->references_count = 0;
    switch (s.type) {
        case Point:
            data->SpatialType = SPoint;
            data->isolated_point = s.isolated_point;
            break;
        case Curve:
            data->SpatialType = SCurve;
            data->points_count = s.geo_points.size();
            data->points = s.geo_points.data();
            break;
        case CompositeCurve:
            data->SpatialType = SCompositeCurve;
            data->references_count = s.references.size();
            data->references = s.references.data();
            break;
        case Surface:
            data->SpatialType = SSurface;
            data->references_count = s.references.size();
            data->references = s.references.data();
            break;
        case Unknown:
            data->SpatialType = SUnknown;
    }
}

int countFlattened(const Spatial &s) {
    if (s.type == Point || s.type == Curve)
        return 1;
    else if (s.type == Unknown)
        return 0;
    else {
        int res = 0;
        for (auto &y : s.references) {
            res += countFlattened(pDrawer->GetSpatial(y.SpatialID));
        }
        return res;
    }
}

void copyFlattened(std::vector<SpatialReference> &copies, const Spatial &s) {
    if (s.type == Point || s.type == Curve) {
        copies.emplace_back(s.id, 1, s.type);
    } else if (s.type == CompositeCurve || s.type == Surface) {
        for (auto &y : s.references) {
            copyFlattened(copies, pDrawer->GetSpatial(y.SpatialID));
        }
    }
}

S101RULES_API int LuaHost_GetFlattenedAssociations(SpatialReference *ref, int size, int id) {
    auto &s = pDrawer->GetSpatial(id);
    int sz = countFlattened(s);
    if (sz <= size) {
        std::vector<SpatialReference> copies;
        copyFlattened(copies, s);
        std::copy(copies.begin(), copies.end(), ref);
    }
    sz = std::min(sz, 1);
    return sz;
}

S101RULES_API int LuaHost_getIntegerAttributes(void *attr_node_ptr, const char *attr_name, int *data, int size) {
    auto attr_node = fromVoid(attr_node_ptr);
    int total = attr_node->GetIntEnumAttrCount(attr_name);
    for (int i = 1; i <= min(total, size); i++) {
        data[i] = attr_node->GetIntEnumAttr(attr_name, i);
    }
    return total;
}

S101RULES_API int LuaHost_getRealAttributes(void *attr_node_ptr, const char *attr_name, double *data, int size) {
    auto attr_node = fromVoid(attr_node_ptr);
    int total = attr_node->CheckAttrExists(attr_name);
    total = min(total, 1);
    if (total)
        attr_node->GetRealAttrByID(attr_name, data + 1);
    return total;
}

S101RULES_API int LuaHost_getBoolAttributes(void *attr_node_ptr, const char *attr_name, bool *data, int size) {
    auto attr_node = fromVoid(attr_node_ptr);
    int total = attr_node->CheckAttrExists(attr_name);
    total = min(total, 1);
    if (total)
        data[1] = attr_node->GetBoolAttr(attr_name);
    return total;
}

S101RULES_API int LuaHost_getTextAttributes(void *attr_node_ptr, const char *attr_name, const char **data, int size) {
    auto attr_node = fromVoid(attr_node_ptr);
    int total = attr_node->CheckAttrExists(attr_name);
    total = min(total, 1);
    if (total)
        data[1] = attr_node->GetStringAttr(attr_name);
    return total;
}

S101RULES_API int LuaHost_getComplexAttributes(void *attr_node_ptr, const char *attr_name, void **data, int size) {
    auto attr_node = fromVoid(attr_node_ptr);
    int total = attr_node->GetComplexAttrCount(attr_name);
    for (int i = 1; i <= min(total, size); i++) {
        data[i] = toVoid(attr_node->GetComplexAttr(attr_name, i));
    }
    return total;
}

S101RULES_API const char *LuaHost_getPrimitive(int feature_id) {
    return pDrawer->GetFeature(feature_id).GetPermittedPrimitives();
}

S101RULES_API bool LuaHost_display(int feature_id, struct DrawingInstruction *instructions, int instructionCount) {
//    std::cerr << feature_id << "\n";
    S101ObjectDrawerParam param;
    for (int i = 0; i < instructionCount; i++) {
        int id;
        const auto &draw = instructions[i];
        switch (draw.Type) {
            case DrawingInstruction::DrawingInstructionType::NullInstruction:
                continue;
            case DrawingInstruction::DrawingInstructionType::PointInstruction:
                id = idDrawSymbol;
                {
                    const auto &sym = S101Symbols::Symbols()[draw.Symbol.Reference];
                    param.m_SymbolParam = {sym.NumSymbol, sym.OffsetX, sym.OffsetY};
                }
                break;
            case DrawingInstruction::DrawingInstructionType::TextInstruction:
                id = idDrawText;
                param.m_TextParam.x = draw.Text.Offset.X;
                param.m_TextParam.y = draw.Text.Offset.Y;

                param.m_TextParam.text = draw.Text.Elements[0].Text;
                param.m_TextParam.font = "sans";
                {
                    const char *token = draw.Text.Elements[0].Foreground.Token;//"UINFB";//
                    auto clr = S101Colors::Colors()[token];
                    param.m_TextParam.r = clr.R;
                    param.m_TextParam.g = clr.G;
                    param.m_TextParam.b = clr.B;
                }
                param.m_TextParam.transparency = 255 - draw.Text.Elements[0].Foreground.Transparency;

                param.m_TextParam.size = draw.Text.Elements[0].BodySize;
                param.m_TextParam.slant = draw.Text.Elements[0].Font.Slant.Name + 1;
                if (draw.Text.Elements[0].Font.Weight.Name == TextElement::Font_::FontWeight::Bold)
                    param.m_TextParam.weight = 0; // Bold
                else
                    param.m_TextParam.weight = 1; // Medium or Light
                break;
            default:
                continue;
        }
        pDrawer->AddFunction(draw.DisplayParameters.DrawingPriority, draw.DisplayParameters.ViewingGroup, param,
                             id, feature_id);
    }
    return true;
}

}

std::map<std::string, int> optTraces;

int Host_DebuggerEntry2(lua_State *l) {
    const char *type = lua_tostring(l, 1);
    if (strcmp(type, "trace") == 0) {
        optTraces[lua_tostring(l, 2)]++;
    }
    return 0;
}

lua_State *prepareModState() {
    lua_State *state = luaL_newstate();
    luaL_openlibs(state);

    addLuaPath(state, R"(src\OptimizedLuaPortrayal\Rules\?.lua)");
    addLuaPath(state, R"(src\OptimizedLuaPortrayal\SystemRules\?.lua)");

    luaL_loadfile(state, R"(src\OptimizedLuaPortrayal\SystemRules\loadall.lua)");
    int res;
    res = lua_pcall(state, 0, 0, 0);
    if (res != 0) {
        const char *string = lua_tostring(state, -1);
        std::cout << "Modified Lua load error: " << string << "\n";
    }
    addLuaCFunction(state, Host_DebuggerEntry2, "Host_DebuggerEntry");
    return state;
}

void setupOpt(TestObjectDrawer &testObjectDrawer, const std::string &prefix, const std::vector<int> &features) {
    pDrawer = static_cast<IObjectDrawer *>(&testObjectDrawer);

    if (features.empty()) {
        testObjectDrawer.RunOnAllFeatures([](IObjectDrawer *drawer1, int clazz, int index) {
//            if (index == 238)
//                return;
            features_modlua.push_back(index);
        }, prefix);
    } else {
        testObjectDrawer.drawCalls = 0;
        features_modlua = features;
    }
}

void teardownOpt(int runs) {
    for (const auto &x : optTraces) {
        std::cerr << x.first << ": " << x.second << " times\n";
    }
    optTraces.clear();

    pDrawer = nullptr;
    features_modlua.clear();
}

int runModifiedLuaLong(TestObjectDrawer &testObjectDrawer, const std::string &prefix, int runs,
                       const std::vector<int> &features) {
    setupOpt(testObjectDrawer, prefix, features);

    lua_State *L = prepareModState();

    doStringPrintErr(L, "require('jit.opt').start('sizemcode=2048','maxmcode=2048')");

//    doStringPrintErr(L, "require('jit.v').start()");

//    doStringPrintErr(L, "require('mobdebug').start()");
    runPortrayalMainTimes(L, std::max(2, runs / 5));
    timer t("Modified lua");
    runPortrayalMainTimes(L, runs);
    int time = t.stop();
    lua_close(L);

    teardownOpt(runs);

    return time;
}

int runModifiedLuaShort(TestObjectDrawer &testObjectDrawer, const std::string &prefix, int runs,
                        const std::vector<int> &features) {
    setupOpt(testObjectDrawer, prefix, features);


//    doStringPrintErr(L, "require('mobdebug').start()");

    int ttl = 0;
    for (int iter = 0; iter < runs; iter += 5) {
        lua_State *L = prepareModState();
        runPortrayalMainTimes(L, 1);
        timer t("Their lua");
        runPortrayalMainTimes(L, 5);
//    testObjectDrawer.GetMutableContext().SetIsSimplifiedPoints(!testObjectDrawer.GetContext().IsSymbolizedAreas());
        ttl += t.stop();
        lua_close(L);
    }

//    doStringPrintErr(L, "print(require('inspect')(SpyInfo))");

    teardownOpt(runs);
    return ttl;
}

int runModifiedLuaCold(TestObjectDrawer &testObjectDrawer, const std::string &prefix, int runs,
                       const std::vector<int> &features) {
    setupOpt(testObjectDrawer, prefix, features);


//    doStringPrintErr(L, "require('mobdebug').start()");

    int ttl = 0;
    for (int iter = 0; iter < runs; iter++) {
        lua_State *L = prepareModState();
        lua_getglobal(L, "UpdatePortrayalContextParameters");
        lua_pushstring(L, "testset");
        int res = lua_pcall(L, 1, 0, 0);
        if (res != 0) {
            const char *err = lua_tostring(L, -1);
            std::cerr << err << "\n";
            return -0;
        }
        timer t("Their lua");
        runPortrayalMainTimes(L, 1);
        ttl += t.stop();
        lua_close(L);
    }//UpdatePortrayalContextParameters(datasetID)

//    doStringPrintErr(L, "print(require('inspect')(SpyInfo))");

    teardownOpt(runs);
    return ttl;
}

int runModifiedLuaCreate(TestObjectDrawer &testObjectDrawer, const std::string &prefix, int runs,
                         const std::vector<int> &features) {
    setupOpt(testObjectDrawer, prefix, features);


//    doStringPrintErr(L, "require('mobdebug').start()");

    int ttl = 0;
    for (int iter = 0; iter < runs; iter++) {
        lua_State *L = prepareModState();
        timer t("Their lua");
        lua_getglobal(L, "UpdatePortrayalContextParameters");
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

//    doStringPrintErr(L, "print(require('inspect')(SpyInfo))");

    teardownOpt(runs);
    return ttl;
}

int runModifiedLuaSwitch(TestObjectDrawer &first, TestObjectDrawer &second, int runs) {
    std::vector<int> s;
    first.RunOnAllFeatures([&](IObjectDrawer *drawer1, int clazz, int index) {
        features_modlua.push_back(index);
    }, "");
    second.RunOnAllFeatures([&](IObjectDrawer *drawer1, int clazz, int index) {
        s.push_back(index + (1U << 20U));
    }, "");


    int ttl = 0;
    for (int iter = 0; iter < runs; iter += 5) {
        pDrawer = &first;
        lua_State *L = prepareModState();
        runPortrayalMainTimes(L, 10);

        lua_getglobal(L, "ReleasePortrayalContext");
        lua_pushstring(L, "testset");
        int res = lua_pcall(L, 1, 0, 0);
        if (res != 0) {
            const char *err = lua_tostring(L, -1);
            std::cerr << err << "\n";
            return -0;
        }
        swap(features_modlua, s);
        pDrawer = &second;
        lua_getglobal(L, "UpdatePortrayalContextParameters");
        lua_pushstring(L, "testset");
        res = lua_pcall(L, 1, 0, 0);
        if (res != 0) {
            const char *err = lua_tostring(L, -1);
            std::cerr << err << "\n";
            return -0;
        }

        timer t("Their lua");

        runPortrayalMainTimes(L, 1);

        ttl += t.stop();
        swap(features_modlua, s);
        lua_close(L);
    }

    teardownOpt(runs);
    return ttl / runs;
}