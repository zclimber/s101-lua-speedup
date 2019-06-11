-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
function CurrentNonGravitational(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
        if feature.orientation and feature.orientation.orientationValue and feature.currentVelocity and feature.currentVelocity.velocityMaximum then
            featurePortrayal:SetDisplayParameters(33060, 5, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('CURENT01', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%4.1f kn', feature.currentVelocity.velocityMaximum), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51)), nil, PortrayalModel.CreateDisplayParameters(30, 8))
        elseif feature.orientation and feature.orientation.orientationValue then
            featurePortrayal:SetDisplayParameters(33060, 5, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('CURENT01', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
        else
            featurePortrayal:SetDisplayParameters(33060, 5, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('CURDEF01')
        end
    elseif feature.PrimitiveType == PrimitiveType.Point then
        if feature.orientation and feature.orientation.orientationValue and feature.currentVelocity and feature.currentVelocity.velocityMaximum then
            featurePortrayal:SetDisplayParameters(33060, 5, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('CURENT01', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('%4.1f kn', feature.currentVelocity.velocityMaximum), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51)), nil, PortrayalModel.CreateDisplayParameters(30, 8))
        elseif feature.orientation and feature.orientation.orientationValue then
            featurePortrayal:SetDisplayParameters(33060, 5, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('CURENT01', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
        else
            featurePortrayal:SetDisplayParameters(33060, 5, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('CURDEF01')
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
