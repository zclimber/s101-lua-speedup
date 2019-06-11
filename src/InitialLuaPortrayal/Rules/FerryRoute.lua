-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
function FerryRoute(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Curve then
        if feature.categoryOfFerry[1] == 1 then
            featurePortrayal:SetDisplayParameters(25030, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('FERYRT01')
        elseif feature.categoryOfFerry[1] == 2 then
            featurePortrayal:SetDisplayParameters(25030, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('FERYRT02')
        else
            featurePortrayal:SetDisplayParameters(25030, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('FERYRT02')
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        if feature.categoryOfFerry[1] == 2 then
            featurePortrayal:SetDisplayParameters(25030, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('FRYARE52')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'CHBLK'))
        else
            featurePortrayal:SetDisplayParameters(25030, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('FRYARE51')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'CHMGD'))
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        if feature.categoryOfFerry[1] == 2 then
            featurePortrayal:SetDisplayParameters(25030, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('FRYARE52')
            featurePortrayal:AddLineInstruction('NAVARE51')
        else
            featurePortrayal:SetDisplayParameters(25030, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('FRYARE51')
            featurePortrayal:AddLineInstruction('NAVARE51')
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
