-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
function NavigationLine(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Curve then
        if feature.categoryOfNavigationLine == 1 then
            featurePortrayal:SetDisplayParameters(25010, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
            featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        elseif feature.categoryOfNavigationLine == 2 then
            featurePortrayal:SetDisplayParameters(25010, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
            featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        else
            featurePortrayal:SetDisplayParameters(25010, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
