-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.



function Portrayals.AirportAirfield(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:SetDisplayParameters(32240, 4, nil, nil, 'OverRADAR')
        featurePortrayal:AddPointInstruction('AIRARE02')
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        -- Plain and symbolized boundaries use the same symbolization
        featurePortrayal:SetDisplayParameters(32240, 2, nil, nil, 'UnderRADAR')
        featurePortrayal:AddAreaInstruction('AIRARE02')
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'LANDF'))
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
