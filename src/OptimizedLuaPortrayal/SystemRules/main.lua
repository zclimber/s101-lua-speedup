require 'S100Scripting'
require 'PortrayalModel'
require 'PortrayalAPI'
require 'Default'

local ffi = require('ffi')

-- Main entry point for portrayal
function portrayal_main(datasetID, start, step)
    start = start or 1
    step = step or 1

    UpdatePortrayalContextParameters(datasetID)

    local portrayalContext = portrayalContexts[datasetID]

    if not portrayalContext then
        error('Host must call GetPortrayalContextParameters() before calling portrayal_main()')
    end

    local contextParameters = portrayalContext.ContextParameters

    local featurePortrayalItems = portrayalContext.FeaturePortrayalItems

    -- For curves and surfaces, perform line symbology on self and adjacent features so that
    -- higher priority edges suppress lower priority edges.

    local clearInUseContextParameters = false

    if contextParameters._Testing_XSLT_COMPARISON_MODE then
        if defaultFontProportion ~= Text.FontProportion.MonoSpaced then
            clearInUseContextParameters = true

            defaultFontCharacteristics = Text.CreateFontCharacteristics(nil, Text.FontProportion.MonoSpaced)
            defaultFontProportion = Text.FontProportion.MonoSpaced
        end
    else
        if defaultFontProportion ~= Text.FontProportion.Proportional then
            clearInUseContextParameters = true

            defaultFontProportion = Text.FontProportion.Proportional
            defaultFontCharacteristics = Text.CreateFontCharacteristics()
        end
    end

    if TypeSystemChecks(contextParameters._Testing_Portrayal_RuntimeChecks) then
        clearInUseContextParameters = true
    end

    if clearInUseContextParameters then
        for _, featurePortrayalItem in ipairs(featurePortrayalItems) do
            featurePortrayalItem.InUseContextParameters = nil
        end
    end

    --Debug.Break()

    local visibleFeatures = 0
    local cachedFeatures = 0

    for i = start, #featurePortrayalItems, step do
        featurePortrayalItem = featurePortrayalItems[i]

        local feature = featurePortrayalItem.Feature

        if true or feature:IsVisible() or contains(feature.Code, AlwaysVisibleFeatures) then
            visibleFeatures = visibleFeatures + 1

            local featurePortrayal = featurePortrayalItem:NewFeaturePortrayal()

            if ObservedContextParametersChanged(contextParameters, featurePortrayalItem) or true then
                contextParameters._observed = {}

                local status, err = pcall(function()
                    featurePortrayal.DisplayParameters.ScaleMinimum = feature['!scaleMinimum']
                    --featurePortrayal.DisplayParameters.ScaleMaximum = feature['!scaleMaximum']

                    require(feature.Code)
                    _G[feature.Code](feature, featurePortrayal, contextParameters)

                    if #featurePortrayal.DrawingInstructions == 0 then
                        error('No drawing instructions were emitted for feature ' .. feature.ID)
                    elseif featurePortrayal:IsDefaultDisplayParameters() and featurePortrayal.DrawingInstructions[1].Type ~= 'NullInstruction' then
                        error('SetDisplayParameters() not called by portrayal rules for feature ' .. feature.ID)
                    end
                end)

                if not status then
                    Debug.Trace('Error: ' .. err .. '.  Default symbology for ' .. feature.Code .. ' ID=' .. feature.ID .. ' returned.')

                    -- Clear any drawing instructions created up to this point.
                    featurePortrayal = featurePortrayalItem:NewFeaturePortrayal()

                    Default(feature, featurePortrayal, contextParameters)
                end

                featurePortrayalItem.ObservedContextParameters = contextParameters._observed
                featurePortrayalItem.InUseContextParameters = contextParameters._asTable

                local cDrawingInstructionsCount = #(featurePortrayal.DrawingInstructions)

                local cDrawingInstructions

                status, err = pcall(function()
                    cDrawingInstructions = ffi.new('struct DrawingInstruction[?]',
                            cDrawingInstructionsCount, featurePortrayal.DrawingInstructions)
                end)

                if not status then
                    print(err)
                else
                    if not ffi.C.LuaHost_display(feature.ID, cDrawingInstructions, cDrawingInstructionsCount) then
                        break
                    end
                end
            else
                cachedFeatures = cachedFeatures + 1
            end
        end
    end

    Debug.Trace(visibleFeatures .. ' visible features out of ' .. #featurePortrayalItems .. ' processed.')
    Debug.Trace(cachedFeatures .. ' cached features out of ' .. visibleFeatures .. ' visible features skipped.')
end

-- Unknown value

local unknownValueMetatable = {
    __eq = function(o1, o2)
        -- Never called when o1 and o2 are the same table.
        return false
    end,

    __lt = function(o1, o2)
        return false
    end,

    __le = function(o1, o2)
        return o1 == o2
    end
}

unknownValue = { Type = 'UnknownValue' }

setmetatable(unknownValue, unknownValueMetatable)

scaminInfinite = 2147483647
--

defaultFontProportion = Text.FontProportion.Proportional
defaultFontCharacteristics = Text.CreateFontCharacteristics()

-- TODO.  Locate to S-101 specific helper file
SkinOfTheEarthFeatures = {
    'DepthArea',
    'DredgedArea',
    'LandArea',
    'UnsurveyedArea',
    'DockArea',
    'LockBasin'
}

-- Always portray features that extend beyond their geometry.
AlwaysVisibleFeatures = {
    'LightSectored'
}

