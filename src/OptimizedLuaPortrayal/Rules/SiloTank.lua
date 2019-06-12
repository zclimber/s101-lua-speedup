-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
local Portrayals = Portrayals
function Portrayals.SiloTank(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
        if feature.categoryOfSiloTank == 1 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('SILBUI11')
        elseif feature.categoryOfSiloTank == 2 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TNKCON12')
        elseif feature.categoryOfSiloTank == 3 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TOWERS03')
        elseif feature.categoryOfSiloTank == 4 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TOWERS12')
        elseif feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TNKCON12')
        elseif feature.categoryOfSiloTank == 1 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('SILBUI01')
        elseif feature.categoryOfSiloTank == 2 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TNKCON02')
        elseif feature.categoryOfSiloTank == 3 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TOWERS01')
        elseif feature.categoryOfSiloTank == 4 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TOWERS02')
        else
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TNKCON02')
        end
    elseif feature.PrimitiveType == PrimitiveType.Point then
        if feature.categoryOfSiloTank == 1 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('SILBUI11')
        elseif feature.categoryOfSiloTank == 2 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TNKCON12')
        elseif feature.categoryOfSiloTank == 3 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TOWERS03')
        elseif feature.categoryOfSiloTank == 4 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TOWERS12')
        elseif feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TNKCON12')
        elseif feature.categoryOfSiloTank == 1 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('SILBUI01')
        elseif feature.categoryOfSiloTank == 2 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TNKCON02')
        elseif feature.categoryOfSiloTank == 3 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TOWERS01')
        elseif feature.categoryOfSiloTank == 4 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TOWERS02')
        else
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TNKCON02')
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        if feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHBRN'))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHBLK'))
        else
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHBRN'))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'LANDF'))
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        if feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHBRN'))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHBLK'))
        else
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHBRN'))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'LANDF'))
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
