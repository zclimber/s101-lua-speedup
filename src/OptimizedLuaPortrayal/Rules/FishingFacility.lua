-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.



function Portrayals.FishingFacility(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
        if feature.categoryOfFishingFacility == 1 then
            featurePortrayal:SetDisplayParameters(26210, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FSHFAC03')
        elseif feature.categoryOfFishingFacility == 2 then
            featurePortrayal:SetDisplayParameters(26210, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FSHFAC02')
        elseif feature.categoryOfFishingFacility == 3 then
            featurePortrayal:SetDisplayParameters(26210, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FSHFAC02')
        elseif feature.categoryOfFishingFacility == 4 then
            featurePortrayal:SetDisplayParameters(26210, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FSHFAC02')
        else
            featurePortrayal:SetDisplayParameters(26210, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FSHHAV01')
        end
    elseif feature.PrimitiveType == PrimitiveType.Point then
        if feature.categoryOfFishingFacility == 1 then
            featurePortrayal:SetDisplayParameters(26210, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FSHFAC03')
        elseif feature.categoryOfFishingFacility == 2 then
            featurePortrayal:SetDisplayParameters(26210, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FSHFAC02')
        elseif feature.categoryOfFishingFacility == 3 then
            featurePortrayal:SetDisplayParameters(26210, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FSHFAC02')
        elseif feature.categoryOfFishingFacility == 4 then
            featurePortrayal:SetDisplayParameters(26210, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FSHFAC02')
        else
            featurePortrayal:SetDisplayParameters(26210, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FSHHAV01')
        end
    elseif feature.PrimitiveType == PrimitiveType.Curve then
        if feature.categoryOfFishingFacility == 1 then
            featurePortrayal:SetDisplayParameters(26210, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('FSHFAC02')
        else
            featurePortrayal:SetDisplayParameters(26210, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'CHGRD'))
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        if feature.categoryOfFishingFacility == 1 then
            featurePortrayal:SetDisplayParameters(26210, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction('FSHFAC03')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        elseif feature.categoryOfFishingFacility == 2 then
            featurePortrayal:SetDisplayParameters(26210, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction('FSHFAC04')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        elseif feature.categoryOfFishingFacility == 3 then
            featurePortrayal:SetDisplayParameters(26210, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction('FSHFAC04')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        elseif feature.categoryOfFishingFacility == 4 then
            featurePortrayal:SetDisplayParameters(26210, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction('FSHFAC04')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        else
            featurePortrayal:SetDisplayParameters(26210, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction('FSHHAV02')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        if feature.categoryOfFishingFacility == 1 then
            featurePortrayal:SetDisplayParameters(26210, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('FSHFAC03')
            featurePortrayal:AddLineInstruction('NAVARE51')
        elseif feature.categoryOfFishingFacility == 2 then
            featurePortrayal:SetDisplayParameters(26210, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('FSHFAC02')
            featurePortrayal:AddLineInstruction('NAVARE51')
        elseif feature.categoryOfFishingFacility == 3 then
            featurePortrayal:SetDisplayParameters(26210, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('FSHFAC02')
            featurePortrayal:AddLineInstruction('NAVARE51')
        elseif feature.categoryOfFishingFacility == 4 then
            featurePortrayal:SetDisplayParameters(26210, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('FSHFAC02')
            featurePortrayal:AddLineInstruction('NAVARE51')
        else
            featurePortrayal:SetDisplayParameters(26210, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('FSHFAC02')
            featurePortrayal:AddLineInstruction('NAVARE51')
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if featurePortrayal:GetInstructionCount() == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
