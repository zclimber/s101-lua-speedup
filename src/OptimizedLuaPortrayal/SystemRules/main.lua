﻿require 'S100Scripting'
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
    local Portrayals = Portrayals

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

    local C = ffi.C

    --Debug.Break()

    local function portrayalCall(feature, featurePortrayal, contextParameters)
        featurePortrayal.DisplayParameters.ScaleMinimum = feature['!scaleMinimum']
        --featurePortrayal.DisplayParameters.ScaleMaximum = feature['!scaleMaximum']

        Portrayals[feature.Code](feature, featurePortrayal, contextParameters)

        if featurePortrayal:GetInstructionCount() == 0 then
            featurePortrayal:error('No drawing instructions were emitted for feature ' .. feature.ID)
        elseif featurePortrayal:IsDefaultDisplayParameters() and featurePortrayal.DrawingInstructions[0].Type ~= 0 then
            featurePortrayal:error('SetDisplayParameters() not called by portrayal rules for feature ' .. feature.ID)
        end
    end

    local visibleFeatures = 0
    local cachedFeatures = 0

    for i = start, #featurePortrayalItems, step do
        local featurePortrayalItem = featurePortrayalItems[i]

        local feature = featurePortrayalItem.Feature

        if true or feature:IsVisible() or AlwaysVisibleFeatures[feature.Code] then
            visibleFeatures = visibleFeatures + 1

            local featurePortrayal = featurePortrayalItem:NewFeaturePortrayal()

            if contextParameters:SavedObservedParametersDiffer(featurePortrayalItem) or true then
                contextParameters:Reset()

                portrayalCall(feature, featurePortrayal, contextParameters)

                if featurePortrayal.Error then
                    Debug.Trace('Error: ' .. featurePortrayal.Error .. '.  Default symbology for ' .. feature.Code .. ' ID=' .. feature.ID .. ' returned.')

                    -- Clear any drawing instructions created up to this point.
                    featurePortrayal = featurePortrayalItem:NewFeaturePortrayal()

                    Portrayals.Default(feature, featurePortrayal, contextParameters)
                end

                contextParameters:SaveObservedToTable(featurePortrayalItem)

                local cDrawingInstructionsCount = featurePortrayal:GetInstructionCount()

                if not C.LuaHost_display(feature.ID, featurePortrayal.DrawingInstructions, cDrawingInstructionsCount) then
                    break
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
    LightSectored = true
}

