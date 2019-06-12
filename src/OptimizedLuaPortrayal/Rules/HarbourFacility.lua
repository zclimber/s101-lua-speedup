-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.



function Portrayals.HarbourFacility(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
        if feature.categoryOfHarbourFacility[1] == 1 then
            featurePortrayal:SetDisplayParameters(32410, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('ROLROL01')
        elseif feature.categoryOfHarbourFacility[1] == 4 then
            featurePortrayal:SetDisplayParameters(32410, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('HRBFAC09')
        elseif feature.categoryOfHarbourFacility[1] == 5 then
            featurePortrayal:SetDisplayParameters(32410, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('SMCFAC02')
        else
            featurePortrayal:SetDisplayParameters(32410, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('CHINFO07')
        end
    elseif feature.PrimitiveType == PrimitiveType.Point then
        if feature.categoryOfHarbourFacility[1] == 1 then
            featurePortrayal:SetDisplayParameters(32410, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('ROLROL01')
        elseif feature.categoryOfHarbourFacility[1] == 4 then
            featurePortrayal:SetDisplayParameters(32410, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('HRBFAC09')
        elseif feature.categoryOfHarbourFacility[1] == 5 then
            featurePortrayal:SetDisplayParameters(32410, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('SMCFAC02')
        else
            featurePortrayal:SetDisplayParameters(32410, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('CHINFO07')
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        if feature.categoryOfHarbourFacility[1] == 1 then
            featurePortrayal:SetDisplayParameters(32410, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('ROLROL01')
        elseif feature.categoryOfHarbourFacility[1] == 4 then
            featurePortrayal:SetDisplayParameters(32410, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('HRBFAC09')
        elseif feature.categoryOfHarbourFacility[1] == 5 then
            featurePortrayal:SetDisplayParameters(32410, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('SMCFAC02')
        else
            featurePortrayal:SetDisplayParameters(32410, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('CHINFO07')
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        if feature.categoryOfHarbourFacility[1] == 1 then
            featurePortrayal:SetDisplayParameters(32410, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('ROLROL01')
        elseif feature.categoryOfHarbourFacility[1] == 4 then
            featurePortrayal:SetDisplayParameters(32410, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('HRBFAC09')
        elseif feature.categoryOfHarbourFacility[1] == 5 then
            featurePortrayal:SetDisplayParameters(32410, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('SMCFAC02')
        else
            featurePortrayal:SetDisplayParameters(32410, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('CHINFO07')
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
