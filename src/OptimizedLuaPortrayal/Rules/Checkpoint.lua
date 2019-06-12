-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
function Checkpoint(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:SetDisplayParameters(32410, 4, nil, nil, 'UnderRADAR')
        featurePortrayal:AddPointInstruction('CHKPNT01')
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        -- Plain and symbolized boundaries use the same symbolization
        featurePortrayal:SetDisplayParameters(32410, 4, nil, nil, 'UnderRADAR')
        featurePortrayal:AddPointInstruction('POSGEN04')
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
