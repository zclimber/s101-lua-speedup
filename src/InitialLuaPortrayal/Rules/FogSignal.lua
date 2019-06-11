-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
function FogSignal(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:SetDisplayParameters(27080, 6, nil, nil, 'OverRADAR')
        featurePortrayal:AddPointInstruction('FOGSIG01')
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
