-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.



function Portrayals.Tunnel(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:AddNullInstruction()
    elseif feature.PrimitiveType == PrimitiveType.Curve then
        featurePortrayal:SetDisplayParameters(32250, 4, nil, nil, 'OverRADAR')
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        -- Plain and symbolized boundaries use the same symbolization
        featurePortrayal:SetDisplayParameters(32250, 4, nil, nil, 'UnderRADAR')
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if featurePortrayal:GetInstructionCount() == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
