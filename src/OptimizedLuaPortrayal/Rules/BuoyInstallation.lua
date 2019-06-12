-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.



function Portrayals.BuoyInstallation(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
        featurePortrayal:SetDisplayParameters(27010, 8, nil, nil, 'OverRADAR')
        featurePortrayal:AddPointInstruction('BOYMOR11')
        if feature.featureName[1] and feature.featureName[1].name then
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('by %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
        end
    elseif feature.PrimitiveType == PrimitiveType.Point then
        featurePortrayal:SetDisplayParameters(27010, 8, nil, nil, 'OverRADAR')
        featurePortrayal:AddPointInstruction('BOYINB01')
        if feature.featureName[1] and feature.featureName[1].name then
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('by %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
