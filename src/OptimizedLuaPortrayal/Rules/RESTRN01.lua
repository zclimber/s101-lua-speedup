-- RESTRN01 conditional symbology rules file.

-- Referenced CSPs.
require 'RESCSP03'

-- Main entry point for CSP.
function RESTRN01(feature, featurePortrayal, contextParameters)
    if feature.restriction then
        RESCSP03(feature, featurePortrayal, contextParameters)
    end
end
