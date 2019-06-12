-- Converter Version: 0.99.6275.24179

-- Referenced portrayal rules.
require 'DEPARE03'

-- Main entry point for feature type.
local Portrayals = Portrayals
function Portrayals.DredgedArea(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Surface then
        -- Plain and symbolized boundaries use the same symbolization
        featurePortrayal:SetDisplayParameters(13030, 1, nil, nil, 'UnderRADAR')
        DEPARE03(feature, featurePortrayal, contextParameters)
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end
end
