-- LightAirObstruction portrayal rules file.

-- Referenced CSPs.
require 'LightFlareAndDescription'

-- Main entry point for feature type.
local Portrayals = Portrayals
function Portrayals.LightAirObstruction(feature, featurePortrayal, contextParameters)
    featurePortrayal:SetDisplayParameters(27070, 8, nil, nil, 'OverRADAR')

    LightFlareAndDescription(feature, featurePortrayal, contextParameters, 6)
end
