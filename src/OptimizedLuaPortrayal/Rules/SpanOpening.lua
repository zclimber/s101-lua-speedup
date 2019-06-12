-- Main entry point for feature type.

-- UNOFFICIAL:  Rules extracted from S-52 lookup table for BRIDGE.

local Portrayals = Portrayals
local Graphics = Graphics
local PortrayalModel = PortrayalModel
local Symbol = Symbol
local AreaFills = AreaFills
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.SpanOpening(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:AddNullInstruction()
    elseif feature.PrimitiveType == PrimitiveType.Curve then
        featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(1.6, 'CHGRD'))
        featurePortrayal:AddPointInstruction('BRIDGE01')

        -- This if statement is here since the ESRI converter doesn't always emit the mandatory attribute verticalClearanceClosed.verticalClearanceValue.
        if feature.verticalClearanceClosed and feature.verticalClearanceClosed.verticalClearanceValue then
            featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('clr cl %4.1f', feature.verticalClearanceClosed.verticalClearanceValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        end

        -- This if statement is here since the ESRI converter doesn't always emit the mandatory attribute verticalClearanceOpen.verticalClearanceValue.
        if feature.verticalClearanceOpen and feature.verticalClearanceOpen.verticalClearanceValue then
            featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('clr op %4.1f', feature.verticalClearanceOpen.verticalClearanceValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
        featurePortrayal:AddPointInstruction('BRIDGE01')
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(1.28, 'CHGRD'))

        -- This if statement is here since the ESRI converter doesn't always emit the mandatory attribute verticalClearanceClosed.verticalClearanceValue.
        if feature.verticalClearanceClosed and feature.verticalClearanceClosed.verticalClearanceValue then
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('clr cl %4.1f', feature.verticalClearanceClosed.verticalClearanceValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 0)), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        end

        -- This if statement is here since the ESRI converter doesn't always emit the mandatory attribute verticalClearanceOpen.verticalClearanceValue.
        if feature.verticalClearanceOpen and feature.verticalClearanceOpen.verticalClearanceValue then
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('clr op %4.1f', feature.verticalClearanceOpen.verticalClearanceValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 0)), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
        featurePortrayal:AddPointInstruction('BRIDGE01')
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(1.28, 'CHGRD'))

        -- This if statement is here since the ESRI converter doesn't always emit the mandatory attribute verticalClearanceClosed.verticalClearanceValue.
        if feature.verticalClearanceClosed and feature.verticalClearanceClosed.verticalClearanceValue then
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('clr cl %4.1f', feature.verticalClearanceClosed.verticalClearanceValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 0)), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        end

        -- This if statement is here since the ESRI converter doesn't always emit the mandatory attribute verticalClearanceOpen.verticalClearanceValue.
        if feature.verticalClearanceOpen and feature.verticalClearanceOpen.verticalClearanceValue then
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('clr op %4.1f', feature.verticalClearanceOpen.verticalClearanceValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 0)), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end
end
