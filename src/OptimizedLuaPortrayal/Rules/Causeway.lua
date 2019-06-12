-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
function Causeway(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Curve then
        if feature.waterLevelEffect == 4 then
            featurePortrayal:SetDisplayParameters(22010, 5, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.96, 'LANDF'))
        else
            featurePortrayal:SetDisplayParameters(22010, 5, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.96, 'LANDF'))
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        if feature.waterLevelEffect == 4 then
            featurePortrayal:SetDisplayParameters(22010, 5, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('DEPIT'))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'CSTLN'))
        else
            featurePortrayal:SetDisplayParameters(22010, 5, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHBRN'))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CSTLN'))
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        if feature.waterLevelEffect == 4 then
            featurePortrayal:SetDisplayParameters(22010, 5, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('DEPIT'))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'CSTLN'))
        else
            featurePortrayal:SetDisplayParameters(22010, 5, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHBRN'))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CSTLN'))
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
