-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
function Berth(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:SetDisplayParameters(32440, 5, nil, nil, 'OverRADAR')
        featurePortrayal:AddPointInstruction('BRTHNO01')
        featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('Nr %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 0)), nil, PortrayalModel.CreateDisplayParameters(29, 8))
    elseif feature.PrimitiveType == PrimitiveType.Curve then
        featurePortrayal:SetDisplayParameters(32440, 5, nil, nil, 'OverRADAR')
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.96, 'CHGRD'))
        featurePortrayal:AddPointInstruction('BRTHNO01')
        featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('Nr %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(29, 8))
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        -- Plain and symbolized boundaries use the same symbolization
        featurePortrayal:SetDisplayParameters(32440, 3, nil, nil, 'UnderRADAR')
        featurePortrayal:AddPointInstruction('BRTHNO01')
        featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('Nr %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 0)), nil, PortrayalModel.CreateDisplayParameters(29, 8))
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
