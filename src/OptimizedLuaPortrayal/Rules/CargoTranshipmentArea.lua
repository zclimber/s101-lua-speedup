-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.



function Portrayals.CargoTranshipmentArea(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:SetDisplayParameters(26250, 4, nil, nil, 'OverRADAR')
        featurePortrayal:AddPointInstruction('CHINFO07')
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        featurePortrayal:SetDisplayParameters(26250, 3, nil, nil, 'UnderRADAR')
        featurePortrayal:AddPointInstruction('INFARE51')
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHMGF'))
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        featurePortrayal:SetDisplayParameters(26250, 3, nil, nil, 'UnderRADAR')
        featurePortrayal:AddPointInstruction('INFARE51')
        featurePortrayal:AddLineInstruction('CTYARE51')
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
