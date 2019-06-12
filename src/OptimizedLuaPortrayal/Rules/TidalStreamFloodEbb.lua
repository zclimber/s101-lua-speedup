-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
local Portrayals = Portrayals
function Portrayals.TidalStreamFloodEbb(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
        if feature.categoryOfTidalStream == 1 and feature.orientation and feature.orientation.orientationValue then
            featurePortrayal:SetDisplayParameters(33060, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('FLDSTR01', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%4.1f kn', feature.speed.speedMaximum), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51)), nil, PortrayalModel.CreateDisplayParameters(30, 8))
        elseif feature.categoryOfTidalStream == 2 and feature.orientation and feature.orientation.orientationValue then
            featurePortrayal:SetDisplayParameters(33060, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('EBBSTR01', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%4.1f kn', feature.speed.speedMaximum), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51)), nil, PortrayalModel.CreateDisplayParameters(30, 8))
        elseif feature.categoryOfTidalStream == 3 and feature.orientation and feature.orientation.orientationValue then
            featurePortrayal:SetDisplayParameters(33060, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('CURENT01', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%4.1f kn', feature.speed.speedMaximum), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51)), nil, PortrayalModel.CreateDisplayParameters(30, 8))
        else
            featurePortrayal:SetDisplayParameters(33060, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('CURDEF01')
        end
    elseif feature.PrimitiveType == PrimitiveType.Point then
        if feature.categoryOfTidalStream == 1 and feature.orientation and feature.orientation.orientationValue then
            featurePortrayal:SetDisplayParameters(33060, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('FLDSTR01', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%4.1f kn', feature.speed.speedMaximum), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51)), nil, PortrayalModel.CreateDisplayParameters(30, 8))
        elseif feature.categoryOfTidalStream == 2 and feature.orientation and feature.orientation.orientationValue then
            featurePortrayal:SetDisplayParameters(33060, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('EBBSTR01', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%4.1f kn', feature.speed.speedMaximum), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51)), nil, PortrayalModel.CreateDisplayParameters(30, 8))
        elseif feature.categoryOfTidalStream == 3 and feature.orientation and feature.orientation.orientationValue then
            featurePortrayal:SetDisplayParameters(33060, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('CURENT01', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%4.1f kn', feature.speed.speedMaximum), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51)), nil, PortrayalModel.CreateDisplayParameters(30, 8))
        else
            featurePortrayal:SetDisplayParameters(33060, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('CURDEF01')
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        if feature.categoryOfTidalStream == 1 and feature.orientation and feature.orientation.orientationValue then
            featurePortrayal:SetDisplayParameters(33060, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('FLDSTR01', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%4.1f kn', feature.speed.speedMaximum), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51)), nil, PortrayalModel.CreateDisplayParameters(30, 8))
        elseif feature.categoryOfTidalStream == 2 and feature.orientation and feature.orientation.orientationValue then
            featurePortrayal:SetDisplayParameters(33060, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('EBBSTR01', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%4.1f kn', feature.speed.speedMaximum), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51)), nil, PortrayalModel.CreateDisplayParameters(30, 8))
        elseif feature.categoryOfTidalStream == 3 and feature.orientation and feature.orientation.orientationValue then
            featurePortrayal:SetDisplayParameters(33060, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('CURENT01', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%4.1f kn', feature.speed.speedMaximum), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51)), nil, PortrayalModel.CreateDisplayParameters(30, 8))
        else
            featurePortrayal:SetDisplayParameters(33060, 2, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('CURDEF01')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        if feature.categoryOfTidalStream == 1 and feature.orientation and feature.orientation.orientationValue then
            featurePortrayal:SetDisplayParameters(33060, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('FLDSTR01', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%4.1f kn', feature.speed.speedMaximum), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51)), nil, PortrayalModel.CreateDisplayParameters(30, 8))
        elseif feature.categoryOfTidalStream == 2 and feature.orientation and feature.orientation.orientationValue then
            featurePortrayal:SetDisplayParameters(33060, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('EBBSTR01', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%4.1f kn', feature.speed.speedMaximum), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51)), nil, PortrayalModel.CreateDisplayParameters(30, 8))
        elseif feature.categoryOfTidalStream == 3 and feature.orientation and feature.orientation.orientationValue then
            featurePortrayal:SetDisplayParameters(33060, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('CURENT01', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%4.1f kn', feature.speed.speedMaximum), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51)), nil, PortrayalModel.CreateDisplayParameters(30, 8))
        else
            featurePortrayal:SetDisplayParameters(33060, 2, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('CURDEF01')
            featurePortrayal:AddLineInstruction('TIDINF51')
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
