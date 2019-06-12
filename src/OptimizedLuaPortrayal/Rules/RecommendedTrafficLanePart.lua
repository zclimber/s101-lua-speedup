-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.



function Portrayals.RecommendedTrafficLanePart(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
        if feature.orientation and feature.orientation.orientationValue then
            featurePortrayal:SetDisplayParameters(25020, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RCTLPT52', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
        else
            featurePortrayal:SetDisplayParameters(25020, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('RTLDEF51')
        end
    elseif feature.PrimitiveType == PrimitiveType.Point then
        if feature.orientation and feature.orientation.orientationValue then
            featurePortrayal:SetDisplayParameters(25020, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RCTLPT52', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
        else
            featurePortrayal:SetDisplayParameters(25020, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('RTLDEF51')
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        if feature.orientation and feature.orientation.orientationValue then
            featurePortrayal:SetDisplayParameters(25020, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RCTLPT52', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
        else
            featurePortrayal:SetDisplayParameters(25020, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('RTLDEF51')
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        if feature.orientation and feature.orientation.orientationValue then
            featurePortrayal:SetDisplayParameters(25020, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('RCTLPT52', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
        else
            featurePortrayal:SetDisplayParameters(25020, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('RTLDEF51')
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if featurePortrayal:GetInstructionCount() == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
