//
// Created by ME on 08.04.2019.
//

#include "InitialLua.h"
#include "IObjectDrawer.h"
#include "LuaUtil.h"
#include "S100RulesParser/private/S101Primitives.h"
#include <vector>
#include <iostream>
#include <cstring>

IObjectDrawer *drawer;

std::vector<int> features_theirlua;

std::map<std::string, int> traces;

int Host_Dataset_GetFeatures(lua_State *l) {
    lua_createtable(l, features_theirlua.size(), 0);
    lua_getglobal(l, "CreateFeature");
    const auto &feats_by_id = drawer->GetCatalogue().feats_by_id;

    int id = 1;
    for (auto x : features_theirlua) {
        lua_pushvalue(l, -1);
        lua_pushinteger(l, x);
        const auto &className = feats_by_id.find(drawer->GetFeature(x).GetClass())->second.name;
        lua_pushstring(l, className.c_str());
        lua_pcall(l, 2, 1, 0);
        lua_rawseti(l, -3, id++);
    }

    lua_pop(l, 1);
    return 1;
}

int Host_Feature_IsVisible(lua_State *l) {
    lua_pushboolean(l, true);
    return 1;
}

int Host_Feature_GetAttribute(lua_State *l) { // TODO verbose
    int feature_index = lua_tointeger(l, 1);
    int clazz = drawer->GetFeature(feature_index).GetClass();
    const Catalogue &catalogue = drawer->GetCatalogue();

    const IAttrContainer *root = &drawer->GetFeature(feature_index);
    const ComplexAttrDescriptor *core = &catalogue.feats_by_id.find(clazz)->second;

    int pairs = lua_objlen(l, 3) / 2;
    if (pairs > 0) {
        for (int i = 0; i < pairs && root != nullptr; i++) {
            lua_rawgeti(l, 3, i * 2 + 1);
            lua_rawgeti(l, 3, i * 2 + 2);
            const char *name = lua_tostring(l, 4);
            int index = lua_tointeger(l, 5);
            core = catalogue.attributes_complex.find(name)->second;
            root = root->GetComplexAttr(name, index);
            lua_settop(l, 3);
        }
    }
    if (root == nullptr) {
        lua_pushnil(l);
        lua_pushinteger(l, 2);
        lua_pushnil(l);
        return 3;
    }
    const char *name = lua_tostring(l, 2);
    auto simple_find = core->sub_attrs_simple.find(name);
    if (simple_find != core->sub_attrs_simple.end()) { // simple attribute
        lua_pushboolean(l, false);
        if (simple_find->second.second.upper == 1) { // once attribute
            if (!root->CheckAttrExists(name)) { // no such attr for this instance
                lua_pushnil(l);
                lua_pushnil(l);
                return 3;
            } else {
                switch (simple_find->second.first->type_id) {
                    case SimpleAttrDescriptor::Type::Real : {
                        double d;
                        root->GetRealAttrByID(name, &d);
                        lua_pushnumber(l, d);
                    }
                        break;
                    case SimpleAttrDescriptor::Type::Int :
                    case SimpleAttrDescriptor::Type::Enum:
                        lua_pushinteger(l, root->GetIntEnumAttr(name, 1));
                        break;
                    case SimpleAttrDescriptor::Type::Text:
                        lua_pushstring(l, root->GetStringAttr(name));
                        break;
                    case SimpleAttrDescriptor::Type::Bool:
                        lua_pushboolean(l, root->GetBoolAttr(name));
                        break;
                    default:
                        lua_err(l, "Requesting single time or date");
                }
                lua_pushvalue(l, -1);
//                lua_pushstring(l, "UNDEFINEDNAME");
                return 3;
            }
        } else {
            int items = root->CheckAttrExists(name);
            lua_createtable(l, items, 0);
            lua_createtable(l, items, 0);
            for (int i = 1; i <= items; i++) {
                switch (simple_find->second.first->type_id) {
                    case SimpleAttrDescriptor::Type::Enum:
                        lua_pushinteger(l, root->GetIntEnumAttr(name, 1));
                        break;
                    default:
                        lua_err(l, "Requesting array not enum");
                }
                lua_rawseti(l, -3, i);
                lua_pushstring(l, "UNDEFINEDNAME");
                lua_rawseti(l, -2, i);
            }
            return 3;
        }
    } else {
        auto complex_find = core->sub_attrs_complex.find(name);
        if (complex_find != core->sub_attrs_complex.end()) {
            lua_pushboolean(l, true);
            lua_pushinteger(l, root->GetComplexAttrCount(name));
            lua_pushboolean(l, complex_find->second.upper != 1);
            return 3;
        } else {
            lua_pushnil(l);
            lua_pushinteger(l, 2);
            lua_pushnil(l);
            return 3;
        }
    }

}

int Host_Feature_GetSpatialAssociations(lua_State *l) { // TODO actual spatial associations
    int id = lua_tointeger(l, 1);

    lua_createtable(l, 1, 0);

    lua_getglobal(l, "CreateSpatialAssociation");
    const auto &feature = drawer->GetFeature(id);
    lua_pushstring(l, feature.GetPermittedPrimitives());
    lua_pushinteger(l, feature.GetSpatialId().SpatialID);
    switch (feature.GetSpatialId().Orientation) {
        case 1:
            lua_pushstring(l, "Forward");
            break;
        case 2:
            lua_pushstring(l, "Reverse");
            break;
        default:
            lua_pushnil(l);
    }
    lua_pcall(l, 3, 1, 0);
    lua_rawseti(l, -2, 1);

    return 1;
}

int Host_Feature_GetFeatureAssociations(lua_State *l) {
    lua_err(l, "Host_Feature_GetFeatureAssociations not implemented");
}

int Host_Feature_GetInformationAssociations(lua_State *l) {
    return 0; // no information associations in data
    lua_err(l, "Host_Feature_GetInformationAssociations not implemented");
}

int Host_GetSpatial(lua_State *l) {
    int id = lua_tointeger(l, -1);
    auto &spat = drawer->GetSpatial(id);
    lua_settop(l, 0);
    switch (spat.type) {
        case Point:
            lua_getglobal(l, "CreatePoint");
            lua_pushnumber(l, spat.isolated_point.lat);
            lua_pushnumber(l, spat.isolated_point.lon);
            lua_call(l, 2, 1);
            return 1;
        case Curve:
            lua_getglobal(l, "CreatePoint");
            lua_createtable(l, spat.geo_points.size(), 0);
            lua_getglobal(l, "CreateCurve");
            for (int i = 1; i <= spat.geo_points.size(); i++) {
                auto &x = spat.geo_points[i - 1];
                lua_pushvalue(l, 1);
                lua_pushnumber(l, x.lat);
                lua_pushnumber(l, x.lon);
                lua_call(l, 2, 1);
                lua_rawseti(l, 2, i);
            }
            lua_rawgeti(l, 2, 1);
            lua_rawgeti(l, 2, spat.geo_points.size());
            lua_getglobal(l, "CreateCurveSegment");
            lua_pushvalue(l, 2);
            lua_call(l, 1, 1);
            lua_call(l, 3, 1);
            return 1;
        case CompositeCurve:
            lua_getglobal(l, "CreateSpatialAssociation");
            lua_getglobal(l, "CreateCompositeCurve");
            lua_createtable(l, spat.references.size(), 0);
            for (int i = 1; i <= spat.references.size(); i++) {
                auto &x = spat.references[i - 1];
                lua_pushvalue(l, 1);
                lua_pushstring(l, x.SpatialTypeName());
                lua_pushinteger(l, x.SpatialID);
                switch (x.Orientation) {
                    case 1:
                        lua_pushstring(l, "Forward");
                        break;
                    case 2:
                        lua_pushstring(l, "Reverse");
                        break;
                    default:
                        lua_pushnil(l);
                }
                lua_call(l, 3, 1);
                lua_rawseti(l, 3, i);
            }
            lua_call(l, 1, 1);
            return 1;
        case Surface:
            lua_getglobal(l, "CreateSpatialAssociation");
            lua_createtable(l, std::max(0, (int) spat.references.size() - 1), 0);
            lua_getglobal(l, "CreateSurface");
            for (int i = 1; i <= spat.references.size(); i++) {
                auto &x = spat.references[i - 1];
                lua_pushvalue(l, 1);
                lua_pushstring(l, x.SpatialTypeName());
                lua_pushinteger(l, x.SpatialID);
                switch (x.Orientation) {
                    case 1:
                        lua_pushstring(l, "Forward");
                        break;
                    case 2:
                        lua_pushstring(l, "Reverse");
                        break;
                    default:
                        lua_pushnil(l);
                }
                lua_call(l, 3, 1);
                if (i > 1)
                    lua_rawseti(l, 2, i - 1);
            }
            lua_pushvalue(l, 2);
            lua_call(l, 2, 1);
            return 1;
        case Unknown:
        default:
            lua_err(l, "Requested unknown spatial");
    }
}

int Host_Spatial_GetInformationAssociations(lua_State *l) {
    return 0; // no information associations in data
    lua_err(l, "Host_Spatial_GetInformationAssociations not implemented");
}

int Host_Spatial_GetAssociatedFeatures(lua_State *l) {
    lua_err(l, "Host_Spatial_GetAssociatedFeatures not implemented");
}

int Host_Information_GetAttribute(lua_State *l) {
    lua_err(l, "Host_Information_GetAttribute not implemented");
}

template<class T>
void readVector(lua_State *l, T &t) {
    lua_getfield(l, -1, "X");
    t.x = lua_tonumber(l, -1);
    lua_getfield(l, -2, "Y");
    t.y = lua_tonumber(l, -1);
    lua_pop(l, 3);
}

template<class T>
void readColor(lua_State *l, T &t) {
    lua_getfield(l, -1, "Token");
    if (lua_isstring(l, -1)) {
        auto clr = S101Colors::Colors()[lua_tostring(l, -1)];
        t.r = clr.R;
        t.g = clr.G;
        t.b = clr.B;
        lua_pop(l, 2);
    } else {
        lua_getfield(l, -2, "R");
        t.r = lua_tonumber(l, -1);
        lua_getfield(l, -3, "G");
        t.g = lua_tonumber(l, -1);
        lua_getfield(l, -4, "B");
        t.b = lua_tonumber(l, -1);
        lua_pop(l, 5);
    }
}

template<class T>
void readColorTransparency(lua_State *l, T &t) {
    lua_pushvalue(l, -1);
    readColor(l, t);
    lua_getfield(l, -1, "Transparency");
    t.transparency = 255 - lua_tonumber(l, -1);
    lua_pop(l, 2);
}

int Host_FeaturePortrayal_Emit(lua_State *l) {
//    lua_pushboolean(l, true);
//    return 1;
    lua_getfield(l, 1, "DrawingInstructions");

    int instructions = lua_objlen(l, 2);

    bool first = true;

    for (int ins = 1; ins <= instructions; ins++) {
        lua_settop(l, 2);
        lua_rawgeti(l, 2, ins);
        lua_getfield(l, 3, "Type");
        std::string type = lua_tostring(l, -1);

        lua_getfield(l, 3, "FeatureReference");
        int index_feature = lua_tointeger(l, -1);

//        if(first && type != "NullInstruction"){
//            first = false;
//            std::cerr << index_feature << ",";
//        }

        lua_getfield(l, 3, "DisplayParameters"); // TODO get ScaleMinimum, ScaleMaximum, DisplayPlane

        lua_getfield(l, 6, "ViewingGroup");
        int viewing_group = lua_tointeger(l, -1);

        lua_getfield(l, 6, "DrawingPriority");
        int drawing_priority = lua_tointeger(l, -1);

        //TODO get display parameters
        lua_settop(l, 3);
        S101ObjectDrawerParam param{};
        if (drawer->GetContext().CheckViewingGroup(viewing_group) || type == "NullInstruction") {
            // Nothing
        } else if (type == "PointInstruction") {
            lua_getfield(l, 3, "Spatials");
            if (!lua_isnil(l, 4)) {
                lua_err(l, "PointInstruction with spatials not implemented");
            }
            lua_pop(l, 1);
            lua_getfield(l, 3, "Symbol");
            lua_getfield(l, 4, "Reference");
            std::string reference = lua_tostring(l, 5);
            const auto &sym = S101Symbols::Symbols()[reference];
            param.m_SymbolParam = {sym.NumSymbol, sym.OffsetX, sym.OffsetY};
            drawer->AddFunction(drawing_priority, viewing_group, param, idDrawSymbol, index_feature);
            //
        } else if (type == "TextInstruction") {
            lua_getfield(l, 3, "Spatials");
            if (!lua_isnil(l, 4)) {
                lua_err(l, "PointInstruction with spatials not implemented");
            }
            lua_pop(l, 1);

            lua_getfield(l, 3, "Text");
            lua_getfield(l, 4, "Type");
            type = lua_tostring(l, -1);
            lua_pop(l, 1);
            if (type == "TextPoint") {
                lua_getfield(l, 4, "Offset");
                readVector(l, param.m_TextParam);

                lua_getfield(l, 4, "Elements");

                int textElements = lua_objlen(l, 5);
                for (int elem = 1; elem <= textElements; elem++) {
                    lua_rawgeti(l, 5, elem);

                    lua_getfield(l, 6, "Font"); // 7

                    lua_getfield(l, 6, "Text");
                    param.m_TextParam.text = lua_tostring(l, -1);
                    param.m_TextParam.font = "sans";

                    lua_getfield(l, 6, "Foreground");
                    readColorTransparency(l, param.m_TextParam);

                    lua_getfield(l, 6, "BodySize");
                    param.m_TextParam.size = lua_tointeger(l, -1);

                    lua_getfield(l, 7, "Slant");
                    lua_getfield(l, -1, "Value");
                    param.m_TextParam.slant = lua_tointeger(l, -1);

                    lua_getfield(l, 7, "Weight");
                    lua_getfield(l, -1, "Value");
                    if (lua_tointeger(l, -1) == 3)
                        param.m_TextParam.weight = 0; // Bold
                    else
                        param.m_TextParam.weight = 1; // Medium or Light

                    drawer->AddFunction(drawing_priority, viewing_group, param, idDrawText, index_feature);
                }
                // Offset vector
                // Elements array of (1) TextElement
                // AreaPlacement, VerticalAlignment, HorizontalAlignment, Rotation - ignored

                // TextElement: Text string
                // BodySize num
                // Foreground Color: Token string + Transparency
                // VerticalOffset num
                // Proportion
                // Font FontCharacteristics:
                // Weight, Serifs bool, Slant

            } else if (type == "TextLine") {
                lua_err(l, "TextLine not yet implemented");
            }
        } else {
//            std::cerr << type << "\n"; // TODO other instructions
        }
    }

    lua_pushboolean(l, true);
    return 1;
}

int Host_DebuggerEntry(lua_State *l) {
    const char *type = lua_tostring(l, 1);
    if (strcmp(type, "trace") == 0) {
        traces[lua_tostring(l, 2)]++;
    }
    return 0;
}

lua_State *prepareTheirState() {
    lua_State *state = luaL_newstate();
    luaL_openlibs(state);

    addLuaCFunction(state, Host_Dataset_GetFeatures, "Host_Dataset_GetFeatures");
    addLuaCFunction(state, Host_Feature_IsVisible, "Host_Feature_IsVisible");
    addLuaCFunction(state, Host_Feature_GetAttribute, "Host_Feature_GetAttribute");
    addLuaCFunction(state, Host_Feature_GetSpatialAssociations, "Host_Feature_GetSpatialAssociations");
    addLuaCFunction(state, Host_Feature_GetFeatureAssociations, "Host_Feature_GetFeatureAssociations");
    addLuaCFunction(state, Host_Feature_GetInformationAssociations, "Host_Feature_GetInformationAssociations");
    addLuaCFunction(state, Host_GetSpatial, "Host_GetSpatial");
    addLuaCFunction(state, Host_Spatial_GetInformationAssociations, "Host_Spatial_GetInformationAssociations");
    addLuaCFunction(state, Host_Spatial_GetAssociatedFeatures, "Host_Spatial_GetAssociatedFeatures");
    addLuaCFunction(state, Host_Information_GetAttribute, "Host_Information_GetAttribute");
    addLuaCFunction(state, Host_FeaturePortrayal_Emit, "Host_FeaturePortrayal_Emit");

    addLuaCFunction(state, Host_DebuggerEntry, "Host_DebuggerEntry");

    addLuaPath(state, R"(src\InitialLuaPortrayal\Rules\?.lua)");

    luaL_loadfile(state, R"(src\InitialLuaPortrayal\Rules\main.lua)");
    int res = lua_pcall(state, 0, 0, 0);
    if (res != 0) {
        std::cerr << lua_tostring(state, -1) << "\n";
        return state;
    }

    return state;
}

void setContextParameters(lua_State *L, const IContext &ctx) {
    lua_getglobal(L, "GetPortrayalContextParameters");
    lua_pushstring(L, "testset");
    int res = lua_pcall(L, 1, 1, 0);
    if (res != 0) {
        std::cerr << lua_tostring(L, -1) << "\n";
        return;
    }

    lua_pushboolean(L, !ctx.GetFourShades());
    lua_setfield(L, -2, "TWO_SHADES");
    lua_pushboolean(L, ctx.GetShallowPattern());
    lua_setfield(L, -2, "SHALLOW_PATTERN");
    lua_pushboolean(L, ctx.IsSimplifiedPoints());
    lua_setfield(L, -2, "SIMPLIFIED_POINTS");
    lua_pushboolean(L, !ctx.IsSymbolizedAreas());
    lua_setfield(L, -2, "PLAIN_BOUNDARIES");

    lua_pushnumber(L, ctx.GetDeepContour());
    lua_setfield(L, -2, "DEEP_CONTOUR");
    lua_pushnumber(L, ctx.GetSafetyContour());
    lua_setfield(L, -2, "SAFETY_CONTOUR");
    lua_pushnumber(L, ctx.GetSafetyDepth());
    lua_setfield(L, -2, "SAFETY_DEPTH");
    lua_pushnumber(L, ctx.GetShallowContour());
    lua_setfield(L, -2, "SHALLOW_CONTOUR");
}

void runLuaTimes(lua_State *L, int times = 1) {
    for (int i = 0; i < times; i++) {
        lua_getglobal(L, "portrayal_main");
        lua_pushstring(L, "testset");
        int res = lua_pcall(L, 1, 0, 0);
        if (res != 0) {
            std::cerr << lua_tostring(L, -1) << "\n";
            return;
        }
    }
}

int runInitialLua(TestObjectDrawer &testObjectDrawer, const std::string &prefix, int warmup, int runs,
                  const std::vector<int> &features) {
    drawer = &testObjectDrawer;

    if (features.empty()) {
        testObjectDrawer.RunOnAllFeatures([](IObjectDrawer *drawer1, int clazz, int index) {
            features_theirlua.push_back(index);
        }, prefix);
    } else {
        testObjectDrawer.drawCalls = 0;
        features_theirlua = features;
    }

    lua_State *L = prepareTheirState();

//    doStringPrintErr(L, "require('mobdebug').start()");

    setContextParameters(L, testObjectDrawer.GetContext());
    runPortrayalMainTimes(L, std::max(2, warmup));
    timer t("Their lua");
    runPortrayalMainTimes(L, runs);
//    testObjectDrawer.GetMutableContext().SetIsSimplifiedPoints(!testObjectDrawer.GetContext().IsSymbolizedAreas());
    int time = t.stop();

    for (const auto &x : traces) {
        std::cerr << x.first << ": " << x.second / (warmup + runs) << " times\n";
    }

//    doStringPrintErr(L, "print(require('inspect')(SpyInfo))");

    lua_close(L);
    traces.clear();
    features_theirlua.clear();
    return time;
}
