-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.



function Portrayals.ProductionStorageArea(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
        if feature.categoryOfProductionArea == 5 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FLASTK11')
        elseif feature.categoryOfProductionArea == 8 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TNKCON12')
        elseif feature.categoryOfProductionArea == 9 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('WIMCON11')
        elseif feature.categoryOfProductionArea == 5 then
            featurePortrayal:SetDisplayParameters(32270, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FLASTK01')
        elseif feature.categoryOfProductionArea == 6 then
            featurePortrayal:SetDisplayParameters(32270, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TMBYRD01')
        elseif feature.categoryOfProductionArea == 8 then
            featurePortrayal:SetDisplayParameters(32270, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TNKCON02')
        elseif feature.categoryOfProductionArea == 9 then
            featurePortrayal:SetDisplayParameters(32270, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('WIMCON01')
        else
            featurePortrayal:SetDisplayParameters(32270, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('PRDINS02')
        end
    elseif feature.PrimitiveType == PrimitiveType.Point then
        if feature.categoryOfProductionArea == 5 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FLASTK11')
        elseif feature.categoryOfProductionArea == 8 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TNKCON12')
        elseif feature.categoryOfProductionArea == 9 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('WIMCON11')
        elseif feature.categoryOfProductionArea == 5 then
            featurePortrayal:SetDisplayParameters(32270, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FLASTK01')
        elseif feature.categoryOfProductionArea == 6 then
            featurePortrayal:SetDisplayParameters(32270, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TMBYRD01')
        elseif feature.categoryOfProductionArea == 8 then
            featurePortrayal:SetDisplayParameters(32270, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TNKCON02')
        elseif feature.categoryOfProductionArea == 9 then
            featurePortrayal:SetDisplayParameters(32270, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('WIMCON01')
        else
            featurePortrayal:SetDisplayParameters(32270, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('PRDINS02')
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        if feature.categoryOfProductionArea == 5 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('RFNERY11')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHBLK'))
        elseif feature.categoryOfProductionArea == 8 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('TNKFRM11')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHBLK'))
        elseif feature.categoryOfProductionArea == 9 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('WNDFRM61')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHBLK'))
        elseif feature.categoryOfProductionArea == 1 then
            featurePortrayal:SetDisplayParameters(32270, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('QUARRY01')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'LANDF'))
        elseif feature.categoryOfProductionArea == 5 then
            featurePortrayal:SetDisplayParameters(32270, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('RFNERY01')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'LANDF'))
        elseif feature.categoryOfProductionArea == 6 then
            featurePortrayal:SetDisplayParameters(32270, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('TMBYRD01')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'LANDF'))
        elseif feature.categoryOfProductionArea == 8 then
            featurePortrayal:SetDisplayParameters(32270, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('TNKFRM01')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'LANDF'))
        elseif feature.categoryOfProductionArea == 9 then
            featurePortrayal:SetDisplayParameters(32270, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('WNDFRM51')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'LANDF'))
        else
            featurePortrayal:SetDisplayParameters(32270, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'LANDF'))
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        if feature.categoryOfProductionArea == 5 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('RFNERY11')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHBLK'))
        elseif feature.categoryOfProductionArea == 8 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('TNKFRM11')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHBLK'))
        elseif feature.categoryOfProductionArea == 9 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('WNDFRM61')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHBLK'))
        elseif feature.categoryOfProductionArea == 1 then
            featurePortrayal:SetDisplayParameters(32270, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('QUARRY01')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'LANDF'))
        elseif feature.categoryOfProductionArea == 5 then
            featurePortrayal:SetDisplayParameters(32270, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('RFNERY01')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'LANDF'))
        elseif feature.categoryOfProductionArea == 6 then
            featurePortrayal:SetDisplayParameters(32270, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('TMBYRD01')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'LANDF'))
        elseif feature.categoryOfProductionArea == 8 then
            featurePortrayal:SetDisplayParameters(32270, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('TNKFRM01')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'LANDF'))
        elseif feature.categoryOfProductionArea == 9 then
            featurePortrayal:SetDisplayParameters(32270, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('WNDFRM51')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'LANDF'))
        else
            featurePortrayal:SetDisplayParameters(32270, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'LANDF'))
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if featurePortrayal:GetInstructionCount() == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
