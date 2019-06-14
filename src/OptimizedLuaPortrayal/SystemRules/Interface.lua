local ffi = require("ffi")

ffi.cdef [[
struct GeoPoint {
    double lat, lon;
};

struct SpatialReference {
    int SpatialID;
    int Orientation;
    int SpatialType;
};

enum CSpatialReferenceType {
    SPoint = 110, SCurve = 120, SCompositeCurve = 125, SSurface = 130, SUnknown = -100
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
    bool SIMPLIFIED_POINTS,
            PLAIN_BOUNDARIES,
            TWO_SHADES,
            SHALLOW_PATTERN,
            SHOW_ISOLATED_DANGERS_IN_SHALLOW_WATERS,
            FULL_SECTORS,
            SCALE_OVERRIDE;
    double
            SAFETY_DEPTH,
            SAFETY_CONTOUR,
            SHALLOW_CONTOUR,
            DEEP_CONTOUR;
    int
            SCALE,
            YEAR,
            MONTH,
            DAY,
            HOUR,
            MINUTE,
            SECOND;
};


int LuaHost_getDatasetSize(const char *dataset_name);
void LuaHost_getDatasetContents(const char *dataset_name, struct CFeature *data, int max_features);
void LuaHost_getDatasetContext(struct CContext *ctx);
void LuaHost_getSpatial(struct CSpatial * data, int id);
int LuaHost_GetFlattenedAssociations(struct SpatialReference *ref, int size, int id);

int LuaHost_getIntegerAttributes(void *attr_node_ptr, const char *attr_name, int *data, int size);
int LuaHost_getRealAttributes(void *attr_node_ptr, const char *attr_name, double *data, int size);
int LuaHost_getBoolAttributes(void *attr_node_ptr, const char *attr_name, bool *data, int size);
int LuaHost_getTextAttributes(void *attr_node_ptr, const char *attr_name, const char **data, int size);
int LuaHost_getComplexAttributes(void *attr_node_ptr, const char *attr_name, void **data, int size);
const char *LuaHost_getPrimitive(int feature_id);

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

struct AreaSymbolPlacement {
    enum AreaPlacementModeEnum {
       VisibleParts, Geographic
    } PlacementMode;
};

struct Color {
    const char *Token;
    double Transparency;
};

struct Symbol_ {
    const char *Reference;
    double Rotation;
    enum CRSTypeEnum {
        GeographicCRS, PortrayalCRS, LocalCRS, LineCRS
    } RotationCRS;
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
    enum HorizontalAlignmentModeEnum {
        Start, End, Center
    } HorizontalAlignment;
    enum VerticalAlignmentModeEnum {
        Top, Bottom, CenterV
    } VerticalAlignment;
    struct TextElement Elements[1];
    int ElementsCount;

    struct PointVector Offset;
    double Rotation;
    struct AreaSymbolPlacement AreaPlacement;

    double StartOffset;
    double EndOffset;
    //LinePlacementMode PlacementMode;
};

struct AreaFillType{
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



struct LineSymbolType{
    const char * Reference;
    double Rotation, ScaleFactor;
    enum CRSTypeEnum CRSType;
};

struct LineStyleType {
    enum LineStyleTypeEnum {
        LineStyleReference, LineStyle
    } Type;
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

struct DrawingSpatialReference{
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
    struct DrawingSpatialReference Spatials[2];
    int SpatialsCount;
    struct DisplayParameters_ DisplayParameters;
    struct Symbol_ Symbol;
    struct Text_ Text;
    struct AreaFillType AreaFill;
    bool Suppression;
    struct LineStyleType LineStyle;
};

bool LuaHost_display(int feature_id, struct DrawingInstruction *instructions, int instructionCount);
]]