-- RESTRN01 conditional symbology rules file.

-- Referenced CSPs.
require 'RESCSP03'

-- Main entry point for CSP.
local Portrayals = Portrayals
local Graphics = Graphics
local PortrayalModel = PortrayalModel
local Symbol = Symbol
local AreaFills = AreaFills
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.RESTRN01(feature, featurePortrayal, contextParameters)
    if feature.restriction then
        Portrayals.RESCSP03(feature, featurePortrayal, contextParameters)
    end
end
