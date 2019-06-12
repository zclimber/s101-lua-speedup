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
function Portrayals.RadioCallingInPoint(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
        if feature.trafficFlow == 1 and feature.orientationValue[1] then
            featurePortrayal:SetDisplayParameters(25060, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RDOCAL02', feature.orientationValue[1], Graphics.CRSType.Geographic))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('Nr %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51)), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
            if feature.communicationChannel[1] then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('ch %s', feature.communicationChannel[1]), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, -3.51)), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.trafficFlow == 2 and feature.orientationValue[1] then
            featurePortrayal:SetDisplayParameters(25060, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RDOCAL02', feature.orientationValue[1], Graphics.CRSType.Geographic))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('Nr %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51)), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
            if feature.communicationChannel[1] then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('ch %s', feature.communicationChannel[1]), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, -3.51)), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.trafficFlow == 3 and feature.orientationValue[1] then
            featurePortrayal:SetDisplayParameters(25060, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RDOCAL02', feature.orientationValue[1], Graphics.CRSType.Geographic))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('Nr %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51)), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
            if feature.communicationChannel[1] then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('ch %s', feature.communicationChannel[1]), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, -3.51)), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.trafficFlow == 4 and feature.orientationValue[1] then
            featurePortrayal:SetDisplayParameters(25060, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RDOCAL03', feature.orientationValue[1], Graphics.CRSType.Geographic))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('Nr %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51)), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
            if feature.communicationChannel[1] then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('ch %s', feature.communicationChannel[1]), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, -3.51)), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        else
            featurePortrayal:SetDisplayParameters(25060, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('RCLDEF01')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('Nr %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        end
    elseif feature.PrimitiveType == PrimitiveType.Point then
        if feature.trafficFlow == 1 and feature.orientationValue[1] then
            featurePortrayal:SetDisplayParameters(25060, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RDOCAL02', feature.orientationValue[1], Graphics.CRSType.Geographic))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('Nr %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51)), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
            if feature.communicationChannel[1] then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('ch %s', feature.communicationChannel[1]), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, -3.51)), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.trafficFlow == 2 and feature.orientationValue[1] then
            featurePortrayal:SetDisplayParameters(25060, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RDOCAL02', feature.orientationValue[1], Graphics.CRSType.Geographic))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('Nr %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51)), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
            if feature.communicationChannel[1] then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('ch %s', feature.communicationChannel[1]), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, -3.51)), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.trafficFlow == 3 and feature.orientationValue[1] then
            featurePortrayal:SetDisplayParameters(25060, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RDOCAL02', feature.orientationValue[1], Graphics.CRSType.Geographic))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('Nr %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51)), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
            if feature.communicationChannel[1] then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('ch %s', feature.communicationChannel[1]), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, -3.51)), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.trafficFlow == 4 and feature.orientationValue[1] then
            featurePortrayal:SetDisplayParameters(25060, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RDOCAL03', feature.orientationValue[1], Graphics.CRSType.Geographic))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('Nr %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51)), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
            if feature.communicationChannel[1] then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('ch %s', feature.communicationChannel[1]), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, -3.51)), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        else
            featurePortrayal:SetDisplayParameters(25060, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('RCLDEF01')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('Nr %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        end
    elseif feature.PrimitiveType == PrimitiveType.Curve then
        if feature.trafficFlow == 1 and feature.orientationValue[1] then
            featurePortrayal:SetDisplayParameters(25060, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'TRFCD'))
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RDOCAL02', feature.orientationValue[1], Graphics.CRSType.Geographic))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('Nr %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
            if feature.communicationChannel[1] then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('ch %s', feature.communicationChannel[1]), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.trafficFlow == 2 and feature.orientationValue[1] then
            featurePortrayal:SetDisplayParameters(25060, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'TRFCD'))
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RDOCAL02', feature.orientationValue[1], Graphics.CRSType.Geographic))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('Nr %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
            if feature.communicationChannel[1] then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('ch %s', feature.communicationChannel[1]), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.trafficFlow == 3 and feature.orientationValue[1] then
            featurePortrayal:SetDisplayParameters(25060, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'TRFCD'))
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RDOCAL02', feature.orientationValue[1], Graphics.CRSType.Geographic))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('Nr %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
            if feature.communicationChannel[1] then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('ch %s', feature.communicationChannel[1]), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.trafficFlow == 4 and feature.orientationValue[1] then
            featurePortrayal:SetDisplayParameters(25060, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'TRFCD'))
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RDOCAL03', feature.orientationValue[1], Graphics.CRSType.Geographic))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('Nr %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
            if feature.communicationChannel[1] then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('ch %s', feature.communicationChannel[1]), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        else
            featurePortrayal:SetDisplayParameters(25060, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'TRFCD'))
            featurePortrayal:AddPointInstruction('RCLDEF01')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('Nr %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
