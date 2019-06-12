-- Main entry point for feature type.
local Portrayals = Portrayals
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.IslandGroup(feature, featurePortrayal, contextParameters)
    -- TODO: Determine portrayal rules if any.  This feature has no spatials, only feature associations.
    featurePortrayal:AddNullInstruction()
end
