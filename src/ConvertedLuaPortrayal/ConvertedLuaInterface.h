//
// Created by ME on 10.05.2019.
//

#ifndef PROJECT_LUAINTERFACE_H
#define PROJECT_LUAINTERFACE_H

#ifdef _MSC_VER
#ifdef S101RULESPARSER_EXPORTS
#define S101RULES_API __declspec(dllexport)
#else
#define S101RULES_API __declspec(dllimport)
#endif
#else
#if defined( __GNUC__ ) && (__GNUC__ >= 4)
#define S101RULES_API __declspec(dllexport)
#else
#define S101RULES_API
#endif // __GNUC__ >= 4
#endif

#include "IObjectDrawer.h"

extern "C" {

struct CFeature {
    int id;
    int clazz;
    const char *Primitive;
    void *attr_node_ptr;
};

struct CContext {
    bool SIMPLIFIED_POINTS = true,
            PLAIN_BOUNDARIES = true,
            TWO_SHADES = true,
            SHALLOW_PATTERN = false,
            SHOW_ISOLATED_DANGERS_IN_SHALLOW_WATERS = false,
            FULL_SECTORS = false,
            SCALE_OVERRIDE = false;
    double
            SAFETY_DEPTH = 30.0,
            SAFETY_CONTOUR = 30.0,
            SHALLOW_CONTOUR = 2.0,
            DEEP_CONTOUR = 30.0;
    int
            SCALE = 0,
            YEAR = 0,
            MONTH = 0,
            DAY = 0,
            HOUR = 0,
            MINUTE = 0,
            SECOND = 0;
};


S101RULES_API int LuaHost2_getDatasetSize(const char *dataset_name);
S101RULES_API void LuaHost2_getDatasetContents(const char *dataset_name, CFeature *data, int max_features);
S101RULES_API void LuaHost2_getDatasetContext(CContext *ctx);

S101RULES_API int LuaHost2_getIntegerAttributes(void *attr_node_ptr, const char *attr_name, int *data, int size);
S101RULES_API int LuaHost2_getRealAttributes(void *attr_node_ptr, const char *attr_name, double *data, int size);
S101RULES_API int LuaHost2_getBoolAttributes(void *attr_node_ptr, const char *attr_name, bool *data, int size);
S101RULES_API int LuaHost2_getTextAttributes(void *attr_node_ptr, const char *attr_name, const char **data, int size);
S101RULES_API int LuaHost2_getComplexAttributes(void *attr_node_ptr, const char *attr_name, void **data, int size);
S101RULES_API const char *LuaHost2_getPrimitive(int feature_id);

S101RULES_API void LuaHost2_AddFunction(int drawing_priority, int viewing_group,
                                        struct S101ObjectDrawerParam *param, int operation, int index_feature);

}

#endif //PROJECT_LUAINTERFACE_H
