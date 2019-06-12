-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.



function Portrayals.MooringWarpingFacility(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
        if feature.categoryOfMooringWarpingFacility == 1 then
            featurePortrayal:SetDisplayParameters(12410, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('MORFAC03')
        elseif feature.categoryOfMooringWarpingFacility == 2 then
            featurePortrayal:SetDisplayParameters(12410, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('MORFAC04')
        elseif feature.categoryOfMooringWarpingFacility == 3 then
            featurePortrayal:SetDisplayParameters(32440, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('PILPNT02')
        elseif feature.categoryOfMooringWarpingFacility == 5 then
            featurePortrayal:SetDisplayParameters(12410, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('PILPNT02')
        elseif feature.categoryOfMooringWarpingFacility == 7 then
            featurePortrayal:SetDisplayParameters(27010, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BOYMOR11')
        else
            featurePortrayal:SetDisplayParameters(12410, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('MORFAC03')
        end
    elseif feature.PrimitiveType == PrimitiveType.Point then
        if feature.categoryOfMooringWarpingFacility == 7 and feature.buoyShape == 3 then
            featurePortrayal:SetDisplayParameters(27010, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BOYMOR01')
        elseif feature.categoryOfMooringWarpingFacility == 7 and feature.buoyShape == 6 then
            featurePortrayal:SetDisplayParameters(27010, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BOYMOR03')
        elseif feature.categoryOfMooringWarpingFacility == 1 then
            featurePortrayal:SetDisplayParameters(12410, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('MORFAC03')
        elseif feature.categoryOfMooringWarpingFacility == 2 then
            featurePortrayal:SetDisplayParameters(12410, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('MORFAC04')
        elseif feature.categoryOfMooringWarpingFacility == 3 then
            featurePortrayal:SetDisplayParameters(32440, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('PILPNT02')
        elseif feature.categoryOfMooringWarpingFacility == 5 then
            featurePortrayal:SetDisplayParameters(12410, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('PILPNT02')
        elseif feature.categoryOfMooringWarpingFacility == 7 then
            featurePortrayal:SetDisplayParameters(27010, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BOYMOR11')
        else
            featurePortrayal:SetDisplayParameters(12410, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('MORFAC03')
        end
    elseif feature.PrimitiveType == PrimitiveType.Curve then
        if feature.categoryOfMooringWarpingFacility == 4 then
            featurePortrayal:SetDisplayParameters(12410, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.64, 'CSTLN'))
        elseif feature.categoryOfMooringWarpingFacility == 6 then
            featurePortrayal:SetDisplayParameters(14010, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHMGF'))
        else
            featurePortrayal:SetDisplayParameters(12410, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.64, 'CSTLN'))
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        -- Plain and symbolized boundaries use the same symbolization
        featurePortrayal:SetDisplayParameters(12410, 6, nil, nil, 'UnderRADAR')
        featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHBRN'))
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHBLK'))
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if featurePortrayal:GetInstructionCount() == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
