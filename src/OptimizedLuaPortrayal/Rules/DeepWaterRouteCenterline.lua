-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
local Portrayals = Portrayals
local Graphics = Graphics
local PortrayalModel = PortrayalModel
local Symbol = Symbol
local AreaFills = AreaFills
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.DeepWaterRouteCenterline(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Curve then
        if feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 1 then
            featurePortrayal:SetDisplayParameters(25010, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('DWRTCL08')
            featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        elseif feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 2 then
            featurePortrayal:SetDisplayParameters(25010, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('DWRTCL08')
            featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        elseif feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 3 then
            featurePortrayal:SetDisplayParameters(25010, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('DWRTCL08')
            featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        elseif feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 4 then
            featurePortrayal:SetDisplayParameters(25010, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('DWRTCL06')
            featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        elseif feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 1 then
            featurePortrayal:SetDisplayParameters(25010, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('DWRTCL07')
            featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        elseif feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 2 then
            featurePortrayal:SetDisplayParameters(25010, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('DWRTCL07')
            featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        elseif feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 3 then
            featurePortrayal:SetDisplayParameters(25010, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('DWRTCL07')
            featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        elseif feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 4 then
            featurePortrayal:SetDisplayParameters(25010, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('DWRTCL05')
            featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        elseif feature.trafficFlow == 1 then
            featurePortrayal:SetDisplayParameters(25010, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('DWRTCL07')
            featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        elseif feature.trafficFlow == 2 then
            featurePortrayal:SetDisplayParameters(25010, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('DWRTCL07')
            featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        elseif feature.trafficFlow == 3 then
            featurePortrayal:SetDisplayParameters(25010, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('DWRTCL07')
            featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        elseif feature.trafficFlow == 4 then
            featurePortrayal:SetDisplayParameters(25010, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('DWRTCL05')
            featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        else
            featurePortrayal:SetDisplayParameters(25010, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('DWLDEF01')
            featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
