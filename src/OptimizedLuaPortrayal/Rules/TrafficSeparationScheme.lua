-- Main entry point for feature type.
local Portrayals = Portrayals
local Graphics = Graphics
local PortrayalModel = PortrayalModel
local Symbol = Symbol
local AreaFills = AreaFills
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.TrafficSeparationScheme(feature, featurePortrayal, contextParameters)
    -- TODO: Determine portrayal rules if any.  This feature has no spatials, only feature associations.
    featurePortrayal:AddNullInstruction()
end
