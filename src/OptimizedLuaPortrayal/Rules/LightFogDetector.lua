-- LightFogDetector portrayal rules file.

-- Referenced CSPs.
require 'LightFlareAndDescription'

-- Main entry point for feature type.
local Portrayals = Portrayals
local Graphics = Graphics
local PortrayalModel = PortrayalModel
local Symbol = Symbol
local AreaFills = AreaFills
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.LightFogDetector(feature, featurePortrayal, contextParameters)
    featurePortrayal:SetDisplayParameters(27070, 8, nil, nil, 'OverRADAR')

    LightFlareAndDescription(feature, featurePortrayal, contextParameters, 7)
end
