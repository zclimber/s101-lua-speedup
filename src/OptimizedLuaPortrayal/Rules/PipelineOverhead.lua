-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
local Portrayals = Portrayals
function Portrayals.PipelineOverhead(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Curve then
        if feature.radarConspicuous then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.96, 'CHGRD'))
            featurePortrayal:AddPointInstruction('RACNSP01')
            if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.radarConspicuous then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.96, 'CHGRD'))
            featurePortrayal:AddPointInstruction('RACNSP01')
            if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        else
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.96, 'CHGRD'))
            if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
