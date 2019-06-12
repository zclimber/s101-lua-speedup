-- Main entry point for feature type.
local Portrayals = Portrayals
function Portrayals.RangeSystem(feature, featurePortrayal, contextParameters)
    -- No portrayal needed.  Portrayal of components is sufficient.
    featurePortrayal:AddNullInstruction()
end
