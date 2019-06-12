-- Main entry point for feature type.
local Portrayals = Portrayals
function Portrayals.DeepWaterRoute(feature, featurePortrayal, contextParameters)
    -- TODO: Determine portrayal rules if any.  This feature has no spatials, only feature associations.
    featurePortrayal:AddNullInstruction()
end
