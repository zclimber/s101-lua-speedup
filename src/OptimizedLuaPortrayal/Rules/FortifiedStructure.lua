-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.



function Portrayals.FortifiedStructure(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
        if feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FORSTC11')
        else
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FORSTC01')
        end
    elseif feature.PrimitiveType == PrimitiveType.Point then
        if feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FORSTC11')
        else
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FORSTC01')
        end
    elseif feature.PrimitiveType == PrimitiveType.Curve then
        featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.96, 'LANDF'))
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
