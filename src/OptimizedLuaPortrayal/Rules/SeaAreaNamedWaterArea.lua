-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
local Portrayals = Portrayals
function Portrayals.SeaAreaNamedWaterArea(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:SetDisplayParameters(21060, 3, nil, nil, 'UnderRADAR')
        if feature.featureName[1] and feature.featureName[1].name then
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(0, 0), nil, nil, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        -- Plain and symbolized boundaries use the same symbolization
        featurePortrayal:SetDisplayParameters(21060, 3, nil, nil, 'UnderRADAR')
        if feature.featureName[1] and feature.featureName[1].name then
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(0, 0), nil, nil, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
