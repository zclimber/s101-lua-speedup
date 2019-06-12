-- DataCoverage portrayal rules file.

-- Main entry point for feature type.
local Portrayals = Portrayals
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.DataCoverage(feature, featurePortrayal, contextParameters)
    featurePortrayal:SetDisplayParameters(21010, 5, nil, nil, 'UnderRADAR')
    featurePortrayal:AddNullInstruction()
end
