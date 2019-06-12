-- Converter Version: 0.99.6275.24179

-- Referenced portrayal rules.
require 'SLCONS04'

-- Main entry point for feature type.
function ShorelineConstruction(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:SetDisplayParameters(12410, 8, nil, nil, 'OverRADAR')
        featurePortrayal:AddPointInstruction('MORFAC03')
        SLCONS04(feature, featurePortrayal, contextParameters)
    elseif feature.PrimitiveType == PrimitiveType.Curve then
        featurePortrayal:SetDisplayParameters(12410, 7, nil, nil, 'OverRADAR')
        SLCONS04(feature, featurePortrayal, contextParameters)
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        -- Plain and symbolized boundaries use the same symbolization
        featurePortrayal:SetDisplayParameters(12410, 7, nil, nil, 'UnderRADAR')
        SLCONS04(feature, featurePortrayal, contextParameters)
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end
end
