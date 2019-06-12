-- QUAPOS01 conditional symbology rules file.

-- Referenced CSPs.
require 'QUAPNT02'
require 'QUALIN02'

-- Main entry point for CSP.
local Portrayals = Portrayals
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.QUAPOS01(feature, featurePortrayal, contextParameters)
    --Debug.Break()
    if feature.PrimitiveType == PrimitiveType.Curve then
        Portrayals.QUALIN02(feature, featurePortrayal, contextParameters)
    else
        local symbol = Portrayals.QUAPNT02(feature, featurePortrayal, contextParameters)

        if symbol then
            featurePortrayal:AddPointInstruction(symbol, nil, PortrayalModel.CreateDisplayParameters(31011))
        end
    end
end
