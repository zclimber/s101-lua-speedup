local ffi = require('ffi')

ffi.cdef [[
enum DrawType {
    idDrawText, idDrawSymbol, idSymbolFillArea, idColourFillArea, idDrawSimpleLine, idDrawComplexlLine
};

struct SymbolParam {
    int symbol_name;
    double offset_x, offset_y;
};

struct TextParam {
    const char *text, *font;
    int r, g, b, transparency;
    int size, weight, slant;
    double x, y;
};

struct SymbolFillAreaParam {
    int symbol;
    double x1, y1;
    double x2, y2;
};

struct ColourFillAreaParam {
    int r, g, b, transparency;
};

struct SimpleLineParam {
    double width;
    int r, g, b;
    double interval, start, length;
};

struct ComplexlLineParam {
    double width;
    int r, g, b;
    double interval, offset;
    const double *dashes;
    int num_dashes_x2;
    const int *symbols;
    const double *symbols_position;
    int num_symb;
    const double *symbol_offset;
};

struct S101ObjectDrawerParam {
    struct SymbolParam m_SymbolParam;
    struct TextParam m_TextParam;
    struct SimpleLineParam m_SimpleLineParam;
    struct ColourFillAreaParam m_ColourFillAreaParam;
    struct SymbolFillAreaParam m_SymbolFillAreaParam;
    struct ComplexlLineParam m_ComplexlLineParam;
};

struct CFeature {
    int id;
    int clazz;
    const char *Primitive;
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


int LuaHost2_getDatasetSize(const char *dataset_name);
void LuaHost2_getDatasetContents(const char *dataset_name, struct CFeature *data, int max_features);
void LuaHost2_getDatasetContext(struct CContext *ctx);

int LuaHost2_getIntegerAttributes(void *attr_node_ptr, const char *attr_name, int *data, int size);
int LuaHost2_getRealAttributes(void *attr_node_ptr, const char *attr_name, double *data, int size);
int LuaHost2_getBoolAttributes(void *attr_node_ptr, const char *attr_name, bool *data, int size);
int LuaHost2_getTextAttributes(void *attr_node_ptr, const char *attr_name, const char **data, int size);
int LuaHost2_getComplexAttributes(void *attr_node_ptr, const char *attr_name, void **data, int size);
const char *LuaHost2_getPrimitive(int feature_id);

void LuaHost2_AddFunction(int drawing_priority, int viewing_group,
                                        struct S101ObjectDrawerParam *param, int operation, int index_feature);
]]

local function createContextProxy()
    local contextParametersDefaults = {
        SIMPLIFIED_POINTS = true,
        PLAIN_BOUNDARIES = true,
        TWO_SHADES = true,
        SAFETY_DEPTH = 30.0,
        SAFETY_CONTOUR = 30.0,
        SHALLOW_CONTOUR = 2.0,
        DEEP_CONTOUR = 30.0,
        SHALLOW_PATTERN = false,
        SHOW_ISOLATED_DANGERS_IN_SHALLOW_WATERS = false,
        FULL_SECTORS = false,
        SCALE = nil,
        SCALE_OVERRIDE = false,
        YEAR = nil,
        MONTH = nil,
        DAY = nil,
        HOUR = nil,
        MINUTE = nil,
        SECOND = nil,

        _Testing_Soundings_PortraySafe = true,
        _Testing_SoundingsAsText = false,
        _Testing_SoundingsAsText_BoldUnsafe = false,
        _Testing_SoundingsAsText_SizeUnsafe = 10,
        _Testing_SoundingsAsText_SizeSafe = 8,
        _Testing_SoundingsAsText_SizeContourLabels = 8,
        _Testing_SoundingsAsText_Font = 'droid',
        _Testing_XSLT_COMPARISON_MODE = false,
        _Testing_Portrayal_RuntimeChecks = false
    }

    local bit = require('bit')
    local contextParametersArray = {}
    local observeLookupTable = {}
    local versionCompares = {}
    do
        local bt = 1
        for k in pairs(contextParametersDefaults) do
            observeLookupTable[k] = bt
            bt = bt * 2
        end
    end
    local version = 0
    local observedCurrent = 0

    local ppMetaTable = {
        __index = function(_, k)
            local r = contextParametersArray[version][k]

            if r == nil then
                error('Invalid mariner setting "' .. tostring(k) .. '"', 2)
            end

            observedCurrent = bit.bor(observedCurrent, observeLookupTable[k])

            return r;
        end
    }

    local ppProxy = {}
    function ppProxy:Reset()
        observedCurrent = 0
    end
    local function setContextParam(to, from, key)
        local value = from[key]
        to[key] = value
    end
    local cContext = ffi.new("struct CContext")
    function ppProxy:Update()
        ffi.C.LuaHost2_getDatasetContext(cContext)

        version = version + 1
        versionCompares = {}
        local newContextParameters = {}
        for k, v in pairs(contextParametersDefaults) do
            newContextParameters[k] = v
            pcall(setContextParam, newContextParameters, cContext, k)
        end
        contextParametersArray[version] = newContextParameters
    end
    local ObservedContextParameters = {}
    local ObservedVersion = {}
    function ppProxy:SaveObservedForFeature(feature_id)
        ObservedContextParameters[feature_id] = observedCurrent
        ObservedVersion[feature_id] = version
    end
    function ppProxy:SavedObservedParametersDiffer(feature_id)
        local observedVersion = ObservedContextParameters[feature_id]
        local observedContextParameters = ObservedVersion[feature_id]
        if (observedVersion == nil) or (observedContextParameters == nil) then
            return true
        end

        local compare = versionCompares[observedVersion]
        if not compare then
            compare = 0
            local observedParameters = contextParametersArray[observedVersion]
            local currentParameters = contextParametersArray[version]
            for k, v in pairs(observeLookupTable) do
                if currentParameters[k] ~= observedParameters[k] then
                    compare = bit.bor(compare, v)
                end
            end
            versionCompares[observedVersion] = compare
        end

        local result = bit.band(observedContextParameters, compare) ~= 0
        if result and observedVersion ~= version then
            ObservedVersion[feature_id] = version
        end
        return result
    end

    setmetatable(ppProxy, ppMetaTable)

    return ppProxy
end

local context = createContextProxy()

local function drawTypeNum(name)
    return tonumber(ffi.new("enum DrawType", name))
end

local drawer = {
    doubleBuf = ffi.new("double[101]"),
    intBuf = ffi.new("int[101]"),
    idDrawText = drawTypeNum("idDrawText"),
    idDrawSymbol = drawTypeNum("idDrawSymbol"),
    idSymbolFillArea = drawTypeNum("idSymbolFillArea"),
    idColourFillArea = drawTypeNum("idColourFillArea"),
    idDrawSimpleLine = drawTypeNum("idDrawSimpleLine"),
    idDrawComplexlLine = drawTypeNum("idDrawComplexlLine"),
    Symbols = require('S101Primitives').SymbolsMap
}

function drawer:setDoubleBuf(contents)
    local buf = self.doubleBuf
    for k, v in ipairs(contents) do
        buf[k - 1] = v
    end
end

function drawer:setIntBuf(contents)
    local buf = self.intBuf
    for k, v in ipairs(contents) do
        buf[k - 1] = v
    end
end

function drawer:AddFunction(drawing_priority, viewing_group, S101ObjectDrawerParam, operation, index_feature)
    ffi.C.LuaHost2_AddFunction(drawing_priority, viewing_group, S101ObjectDrawerParam, operation, index_feature)
end

ffi.metatype("struct CFeature", require('AttributeLookup'))

local featureSets = {}
local featureSetSizes = {}

local function getFeatures(datasetID)
    local featureArray = featureSets[datasetID]
    local featureCount = featureSetSizes[datasetID]
    if not featureArray then
        featureCount = ffi.C.LuaHost2_getDatasetSize(datasetID)
        featureArray = ffi.new('struct CFeature[?]', featureCount)
        ffi.C.LuaHost2_getDatasetContents(datasetID, featureArray, featureCount)
        featureSets[datasetID] = featureArray
        featureSetSizes[datasetID] = featureCount
    end
    return featureArray, featureCount
end

local portrayals = require('DrawFunctionsById')

local ClassNames = require('ClassCodes')

function portrayal_main(datasetID)
    --require("mobdebug").start()
    --require('jit.v').start()
    context:Update()

    local featureArray, featureCount = getFeatures(datasetID)

    local featureTbl = {}
    setmetatable(featureTbl, require('AttributeLookup'))

    for i = 0, featureCount - 1 do
        local portrayal = portrayals[featureArray[i].clazz]
        if portrayal then
            featureTbl.id = featureArray[i].id
            featureTbl.attr_node_ptr = featureArray[i].attr_node_ptr
            featureTbl.Primitive = ffi.string(featureArray[i].Primitive)
            featureTbl.Code = ClassNames[featureArray[i].clazz]
            portrayal(featureTbl, context, drawer)
        end
    end
end