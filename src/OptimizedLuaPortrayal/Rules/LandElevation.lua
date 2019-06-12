-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
function LandElevation(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:SetDisplayParameters(32010, 4, nil, nil, 'OverRADAR')
        featurePortrayal:AddPointInstruction('POSGEN04')
        featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%3.0f m', feature.elevation), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(28, 8))
    elseif feature.PrimitiveType == PrimitiveType.Curve then
        featurePortrayal:SetDisplayParameters(32010, 4, nil, nil, 'OverRADAR')
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'LANDF'))
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
