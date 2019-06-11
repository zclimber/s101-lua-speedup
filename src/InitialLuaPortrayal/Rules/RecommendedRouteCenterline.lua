-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
function RecommendedRouteCenterline(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Curve then
        if feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 1 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('RCRTCL14')
            if feature.orientation and feature.orientation.orientationValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 2 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('RCRTCL14')
            if feature.orientation and feature.orientation.orientationValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 3 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('RCRTCL14')
            if feature.orientation and feature.orientation.orientationValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 4 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('RCRTCL13')
            if feature.orientation and feature.orientation.orientationValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 1 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('RCRTCL12')
            if feature.orientation and feature.orientation.orientationValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 2 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('RCRTCL12')
            if feature.orientation and feature.orientation.orientationValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 3 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('RCRTCL12')
            if feature.orientation and feature.orientation.orientationValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 4 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('RCRTCL11')
            if feature.orientation and feature.orientation.orientationValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.trafficFlow == 1 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('RCRTCL12')
            if feature.orientation and feature.orientation.orientationValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.trafficFlow == 2 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('RCRTCL12')
            if feature.orientation and feature.orientation.orientationValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.trafficFlow == 3 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('RCRTCL12')
            if feature.orientation and feature.orientation.orientationValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.trafficFlow == 4 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('RCRTCL11')
            if feature.orientation and feature.orientation.orientationValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        else
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('RCRDEF11')
            if feature.orientation and feature.orientation.orientationValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
