-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
local Portrayals = Portrayals
function Portrayals.DockArea(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        if feature.condition then
            featurePortrayal:SetDisplayParameters(12420, 2, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('DEPVS'))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(0, 0), nil, nil, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHBLK'))
        else
            featurePortrayal:SetDisplayParameters(12420, 2, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('DEPVS'))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(0, 0), nil, nil, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHBLK'))
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        if feature.condition then
            featurePortrayal:SetDisplayParameters(12420, 2, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('DEPVS'))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(0, 0), nil, nil, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHBLK'))
        else
            featurePortrayal:SetDisplayParameters(12420, 2, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('DEPVS'))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(0, 0), nil, nil, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHBLK'))
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
