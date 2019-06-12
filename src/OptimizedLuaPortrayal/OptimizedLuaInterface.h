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

#include "Spatial.h"

extern "C" {

enum CSpatialReferenceType {
    SPoint = 110, SCurve = 120, SCompositeCurve = 125, SSurface = 130, SUnknown
};

struct CSpatial {
    int SpatialID;
    enum CSpatialReferenceType SpatialType;
    int scale_minimum, scale_maximum;
    struct GeoPoint isolated_point;
    const struct GeoPoint *points;
    const struct SpatialReference *references;
    int points_count, references_count;
};

struct CFeature {
    int id;
    struct SpatialReference SpatialAssociation;
    const char *clazz;
    const char *primitive;
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


S101RULES_API int LuaHost_getDatasetSize(const char *dataset_name);
S101RULES_API void LuaHost_getDatasetContents(const char *dataset_name, struct CFeature *data, int max_features);
S101RULES_API void LuaHost_getDatasetContext(struct CContext *ctx);
S101RULES_API void LuaHost_getSpatial(struct CSpatial *data, int id);
S101RULES_API int LuaHost_GetFlattenedAssociations(SpatialReference *ref, int size, int id);

S101RULES_API int LuaHost_getIntegerAttributes(void *attr_node_ptr, const char *attr_name, int *data, int size);
S101RULES_API int LuaHost_getRealAttributes(void *attr_node_ptr, const char *attr_name, double *data, int size);
S101RULES_API int LuaHost_getBoolAttributes(void *attr_node_ptr, const char *attr_name, bool *data, int size);
S101RULES_API int LuaHost_getTextAttributes(void *attr_node_ptr, const char *attr_name, const char **data, int size);
S101RULES_API int LuaHost_getComplexAttributes(void *attr_node_ptr, const char *attr_name, void **data, int size);
S101RULES_API const char *LuaHost_getPrimitive(int feature_id);

struct DisplayParameters_ {
    enum DisplayPlaneEnum {
        OverRADAR, UnderRADAR
    } DisplayPlane;
    int DrawingPriority;
    int ViewingGroup;
};

struct PointVector {
    double X;
    double Y;
};

enum CRSTypeEnum {
    GeographicCRS, PortrayalCRS, LocalCRS, LineCRS
};

enum AreaPlacementModeEnum {
    VisibleParts, Geographic
};

struct AreaSymbolPlacement {
    struct PlacementMode_ {
        enum AreaPlacementModeEnum Name;
    } PlacementMode;
};

struct HorizontalAlignmentMode {
    enum HorizontalAlignmentModeEnum {
        Start, End, Center
    } Name;
};

struct Color {
    const char *Token;
    double Transparency;
};


struct VerticalAlignmentMode {
    enum VerticalAlignmentModeEnum {
        Top, Bottom, CenterV
    } Name;
};

struct Symbol_ {
    const char *Reference;
    double Rotation;
    enum CRSTypeEnum RotationCRS;
    double ScaleFactor;
    struct PointVector Offset;
    enum AreaPlacementModeEnum PlacementMode;
};

struct TextElement {
    const char *Text;
    double BodySize;
    double VerticalOffset;
    struct Color Foreground;
    struct Color Background;
    struct Font_ {
        enum FontType {
            FontCharacteristics, FontReference
        } Type;
        const char *Reference;
        bool Serifs;
        struct FontProportion {
            enum FontProportionEnum {
                MonoSpaces, Proportional
            } Name;
        } Proportion;
        struct FontSlant {
            enum FontSlantEnum {
                Upright, Italics
            } Name;
        } Slant;
        struct FontWeight {
            enum FontWeightEnum {
                Light, Medium, Bold
            } Name;
        } Weight;
    } Font;
};
struct Text_ {
    enum TextType {
        TextPoint, TextLine
    } Type;
    struct HorizontalAlignmentMode HorizontalAlignment;
    struct VerticalAlignmentMode VerticalAlignment;
    struct TextElement Elements[1];
    int ElementsCount;

    struct PointVector Offset;
    double Rotation;
    struct AreaSymbolPlacement AreaPlacement;

    double StartOffset;
    double EndOffset;
    //LinePlacementMode PlacementMode;
};

struct AreaFillType {
    enum AreaFillTypeEnum {
        AreaFillReference, ColorFill, SymbolFill, HatchFill, PixmapFill
    } Type;
    struct Color Color;
};

struct PenType {
    double Width;
    struct Color Color;
};

struct DashType {
    double Start, Length;
};

struct LineSymbolType {
    const char *Reference;
    double Rotation, ScaleFactor;
    enum CRSTypeEnum CRSType;
};

struct LineStyleType {
    enum LineStyleTypeEnum {
        LineStyleReference, LineStyle
    };
    enum CapStyleType {
        Butt, Square, Round
    } CapStyle;
    enum JoinStyleType {
        Bevel, Miter, RoundJ
    } JoinStyle;
    const char *Reference;
    double IntervalLength, Offset;
    struct DashType Dashes[10];
    struct LineSymbolType Symbols[10];
    struct PenType Pen;
    int DashesCount, SymbolsCount;
};

struct DrawingSpatialReference {
    int ID;
    bool Forward;
};

struct DrawingInstruction {
    enum DrawingInstructionType {
        NullInstruction, PointInstruction, LineInstruction, AreaInstruction,
        TextInstruction, CoverageInstruction, AugmentedGeometry, AugmentedPoint,
        AugmentedLineOrArea, AugmentedRay, AugmentedPath, AugmentedArea
    } Type;
    int FeatureReference;
    struct DrawingSpatialReference *Spatials;
    int SpatialsCount;
    struct DisplayParameters_ DisplayParameters;
    struct Symbol_ Symbol;
    struct Text_ Text;
    struct AreaFillType AreaFill;
    bool Suppression;
    struct LineStyleType LineStyle;
};

S101RULES_API bool LuaHost_display(int feature_id, struct DrawingInstruction *instructions, int instructionCount);

}

#endif //PROJECT_LUAINTERFACE_H
