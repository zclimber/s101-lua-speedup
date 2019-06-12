-- UpdateInformation conditional symbology rules file.

-- UNOFFICIAL: This feature is purely informational so no portrayal needed.

-- Main entry point for CSP.
local Portrayals = Portrayals
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.UpdateInformation(feature, featurePortrayal, contextParameters)
    featurePortrayal:AddNullInstruction()
end
