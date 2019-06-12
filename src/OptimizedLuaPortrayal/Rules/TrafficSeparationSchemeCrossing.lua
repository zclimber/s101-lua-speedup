-- Converter Version: 0.99.6275.24179

-- Referenced portrayal rules.
require 'RESTRN01'

-- Main entry point for feature type.



function Portrayals.TrafficSeparationSchemeCrossing(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Surface then
        -- Plain and symbolized boundaries use the same symbolization
        featurePortrayal:SetDisplayParameters(25010, 6, nil, nil, 'UnderRADAR')
        featurePortrayal:AddAreaInstruction('TSSJCT02')
        featurePortrayal:AddPointInstruction('TSSCRS51')
        Portrayals.RESTRN01(feature, featurePortrayal, contextParameters)
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end
end
