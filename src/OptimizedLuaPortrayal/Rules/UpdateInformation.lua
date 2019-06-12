-- UpdateInformation conditional symbology rules file.

-- UNOFFICIAL: This feature is purely informational so no portrayal needed.

-- Main entry point for CSP.
local Portrayals = Portrayals
function Portrayals.UpdateInformation(feature, featurePortrayal, contextParameters)
    featurePortrayal:AddNullInstruction()
end
