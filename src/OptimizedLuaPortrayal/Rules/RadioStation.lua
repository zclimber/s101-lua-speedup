-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
function RadioStation(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
        if feature.categoryOfRadioStation == 10 then
            featurePortrayal:SetDisplayParameters(38010, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('DRFSTA01')
        else
            featurePortrayal:SetDisplayParameters(38010, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('RDOSTA02')
        end
    elseif feature.PrimitiveType == PrimitiveType.Point then
        if feature.categoryOfRadioStation == 10 then
            featurePortrayal:SetDisplayParameters(38010, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('DRFSTA01')
        else
            featurePortrayal:SetDisplayParameters(38010, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('RDOSTA02')
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
