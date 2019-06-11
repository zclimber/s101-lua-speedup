-- QUAPOS01 conditional symbology rules file.

-- Referenced CSPs.
require 'QUAPNT02'
require 'QUALIN02'

-- Main entry point for CSP.
function QUAPOS01(feature, featurePortrayal, contextParameters)
    --Debug.Break()
    if feature.PrimitiveType == PrimitiveType.Curve then
        QUALIN02(feature, featurePortrayal, contextParameters)
    else
        local symbol = QUAPNT02(feature, featurePortrayal, contextParameters)

        if symbol then
            featurePortrayal:AddPointInstruction(symbol, nil, PortrayalModel.CreateDisplayParameters(31011))
        end
    end
end
