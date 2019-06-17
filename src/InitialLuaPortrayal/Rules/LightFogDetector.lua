-- LightFogDetector portrayal rules file.

-- Referenced CSPs.
require 'LightFlareAndDescription'

-- Main entry point for feature type.
function LightFogDetector(feature, featurePortrayal, contextParameters)
    featurePortrayal:SetDisplayParameters(27070, 8, nil, nil, 'OverRADAR')

    LightFlareAndDescription(feature, featurePortrayal, contextParameters, 7)
end
