-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.



function Portrayals.Retroreflector(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
        featurePortrayal:SetDisplayParameters(27080, 6, nil, nil, 'OverRADAR')
        featurePortrayal:AddPointInstruction('RETRFL02')
    elseif feature.PrimitiveType == PrimitiveType.Point then
        featurePortrayal:SetDisplayParameters(27080, 6, nil, nil, 'OverRADAR')
        featurePortrayal:AddPointInstruction('RETRFL01')
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
