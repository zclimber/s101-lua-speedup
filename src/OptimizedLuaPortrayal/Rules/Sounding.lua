-- Converter Version: 0.99.6275.24179

-- Referenced portrayal rules.
require 'SOUNDG03'

-- Main entry point for feature type.
local Portrayals = Portrayals
function Portrayals.Sounding(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.MultiPoint then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:SetDisplayParameters(33010, 6, nil, nil, 'OverRADAR')
        SOUNDG03(feature, featurePortrayal, contextParameters)
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end
end
