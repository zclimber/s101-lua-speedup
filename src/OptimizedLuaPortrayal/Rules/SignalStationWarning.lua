-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.



function Portrayals.SignalStationWarning(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:SetDisplayParameters(28020, 7, nil, nil, 'OverRADAR')
        featurePortrayal:AddPointInstruction('SISTAT02')
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if featurePortrayal:GetInstructionCount() == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
