-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.



function Portrayals.SandWaves(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:SetDisplayParameters(24010, 4, nil, nil, 'OverRADAR')
        featurePortrayal:AddPointInstruction('SNDWAV02')
    elseif feature.PrimitiveType == PrimitiveType.Curve then
        featurePortrayal:SetDisplayParameters(24010, 4, nil, nil, 'OverRADAR')
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'CHGRD'))
        featurePortrayal:AddPointInstruction('SNDWAV02')
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        featurePortrayal:SetDisplayParameters(24010, 4, nil, nil, 'UnderRADAR')
        featurePortrayal:AddAreaInstruction('SNDWAV01')
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'CHGRD'))
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        featurePortrayal:SetDisplayParameters(24010, 4, nil, nil, 'UnderRADAR')
        featurePortrayal:AddAreaInstruction('SNDWAV01')
        featurePortrayal:AddLineInstruction('NAVARE51')
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if featurePortrayal:GetInstructionCount() == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
