-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.



function Portrayals.DistanceMark(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
        if feature.categoryOfDistanceMark == 1 then
            featurePortrayal:SetDisplayParameters(27030, 7, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('DISMAR04')
        else
            featurePortrayal:SetDisplayParameters(27030, 7, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('DISMAR03')
        end
    elseif feature.PrimitiveType == PrimitiveType.Point then
        if feature.categoryOfDistanceMark == 1 then
            featurePortrayal:SetDisplayParameters(27030, 7, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('DISMAR04')
        else
            featurePortrayal:SetDisplayParameters(27030, 7, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('DISMAR03')
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if featurePortrayal:GetInstructionCount() == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
