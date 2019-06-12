-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
local Portrayals = Portrayals
function Portrayals.RescueStation(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:SetDisplayParameters(38030, 7, nil, nil, 'OverRADAR')
        featurePortrayal:AddPointInstruction('RSCSTA02')
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
