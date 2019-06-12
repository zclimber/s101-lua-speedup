-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
local Portrayals = Portrayals
function Portrayals.SlopingGround(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:SetDisplayParameters(32010, 3, nil, nil, 'UnderRADAR')
        featurePortrayal:AddPointInstruction('HILTOP01')
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        if feature.categoryOfSlope == 1 and feature.radarConspicuous then
            featurePortrayal:SetDisplayParameters(32010, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHGRD'))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHBLK'))
        elseif feature.categoryOfSlope == 2 and feature.radarConspicuous then
            featurePortrayal:SetDisplayParameters(32010, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHGRD'))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHBLK'))
        elseif feature.categoryOfSlope == 3 and feature.radarConspicuous then
            featurePortrayal:SetDisplayParameters(32010, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHGRD'))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHBLK'))
        elseif feature.categoryOfSlope == 4 and feature.radarConspicuous then
            featurePortrayal:SetDisplayParameters(32010, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHGRD'))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHBLK'))
        elseif feature.categoryOfSlope == 5 and feature.radarConspicuous then
            featurePortrayal:SetDisplayParameters(32010, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHGRD'))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHBLK'))
        elseif feature.categoryOfSlope == 6 then
            featurePortrayal:SetDisplayParameters(32010, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHGRD'))
        elseif feature.categoryOfSlope == 7 and feature.radarConspicuous then
            featurePortrayal:SetDisplayParameters(32010, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHGRD'))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHBLK'))
        else
            featurePortrayal:AddNullInstruction()
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        if feature.categoryOfSlope == 1 and feature.radarConspicuous then
            featurePortrayal:SetDisplayParameters(32010, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHGRD'))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHBLK'))
        elseif feature.categoryOfSlope == 2 and feature.radarConspicuous then
            featurePortrayal:SetDisplayParameters(32010, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHGRD'))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHBLK'))
        elseif feature.categoryOfSlope == 3 and feature.radarConspicuous then
            featurePortrayal:SetDisplayParameters(32010, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHGRD'))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHBLK'))
        elseif feature.categoryOfSlope == 4 and feature.radarConspicuous then
            featurePortrayal:SetDisplayParameters(32010, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHGRD'))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHBLK'))
        elseif feature.categoryOfSlope == 5 and feature.radarConspicuous then
            featurePortrayal:SetDisplayParameters(32010, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHGRD'))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHBLK'))
        elseif feature.categoryOfSlope == 6 then
            featurePortrayal:SetDisplayParameters(32010, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHGRD'))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHBLK'))
        elseif feature.categoryOfSlope == 7 and feature.radarConspicuous then
            featurePortrayal:SetDisplayParameters(32010, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHGRD'))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHBLK'))
        else
            featurePortrayal:AddNullInstruction()
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
