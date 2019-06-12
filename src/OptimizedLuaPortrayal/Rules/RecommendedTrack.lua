-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.



function Portrayals.RecommendedTrack(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Curve then
        if feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 1 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('RECTRC12')
            featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        elseif feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 2 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('RECTRC12')
            featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        elseif feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 3 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('RECTRC12')
            featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        elseif feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 4 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('RECTRC10')
            featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        elseif feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 1 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('RECTRC11')
            featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        elseif feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 2 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('RECTRC11')
            featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        elseif feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 3 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('RECTRC11')
            featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        elseif feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 4 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('RECTRC09')
            featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        elseif feature.trafficFlow == 1 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('RECTRC11')
            featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        elseif feature.trafficFlow == 2 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('RECTRC11')
            featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        elseif feature.trafficFlow == 3 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('RECTRC11')
            featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        elseif feature.trafficFlow == 4 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('RECTRC09')
            featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        else
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('RECDEF02')
            featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(11, 8))
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        if feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 1 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RECTRC58', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(14.04, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        elseif feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 2 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RECTRC58', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(14.04, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        elseif feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 3 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RECTRC58', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(14.04, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        elseif feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 4 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RECTRC56', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(14.04, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        elseif feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 1 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RECTRC57', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(14.04, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        elseif feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 2 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RECTRC57', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(14.04, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        elseif feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 3 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RECTRC57', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(14.04, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        elseif feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 4 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RECTRC55', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(14.04, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 1 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RECTRC57', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(14.04, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 2 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RECTRC57', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(14.04, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 3 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RECTRC57', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(14.04, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 4 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RECTRC55', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(14.04, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        else
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('RECDEF51')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        if feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 1 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RECTRC58', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%03.0fdeg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(14.04, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            featurePortrayal:AddLineInstruction('NAVARE51')
        elseif feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 2 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RECTRC58', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(14.04, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            featurePortrayal:AddLineInstruction('NAVARE51')
        elseif feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 3 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RECTRC58', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(14.04, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            featurePortrayal:AddLineInstruction('NAVARE51')
        elseif feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 1 and feature.trafficFlow == 4 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RECTRC56', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(14.04, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            featurePortrayal:AddLineInstruction('NAVARE51')
        elseif feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 1 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RECTRC57', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(14.04, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            featurePortrayal:AddLineInstruction('NAVARE51')
        elseif feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 2 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RECTRC57', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(14.04, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            featurePortrayal:AddLineInstruction('NAVARE51')
        elseif feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 3 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RECTRC57', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(14.04, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            featurePortrayal:AddLineInstruction('NAVARE51')
        elseif feature.orientation and feature.orientation.orientationValue and feature.categoryOfRecommendedTrack == 2 and feature.trafficFlow == 4 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RECTRC55', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(14.04, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            featurePortrayal:AddLineInstruction('NAVARE51')
        elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 1 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RECTRC57', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(14.04, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            featurePortrayal:AddLineInstruction('NAVARE51')
        elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 2 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RECTRC57', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(14.04, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            featurePortrayal:AddLineInstruction('NAVARE51')
        elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 3 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RECTRC57', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(14.04, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            featurePortrayal:AddLineInstruction('NAVARE51')
        elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 4 then
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RECTRC55', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%03.0f deg', feature.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(14.04, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            featurePortrayal:AddLineInstruction('NAVARE51')
        else
            featurePortrayal:SetDisplayParameters(25020, 6, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('RECDEF51')
            featurePortrayal:AddLineInstruction('NAVARE51')
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
