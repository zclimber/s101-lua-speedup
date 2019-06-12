-- Converter Version: 0.99.6275.24179

-- Referenced portrayal rules.
require 'RESTRN01'

-- Main entry point for feature type.
local Portrayals = Portrayals
function Portrayals.MilitaryPracticeArea(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:SetDisplayParameters(26040, 4, nil, nil, 'OverRADAR')
        featurePortrayal:AddPointInstruction('CHINFO06')
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        featurePortrayal:SetDisplayParameters(26040, 4, nil, nil, 'UnderRADAR')
        featurePortrayal:AddPointInstruction('CTYARE51')
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'CHMGD'))
        RESTRN01(feature, featurePortrayal, contextParameters)
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        featurePortrayal:SetDisplayParameters(26040, 4, nil, nil, 'UnderRADAR')
        featurePortrayal:AddPointInstruction('CTYARE51')
        featurePortrayal:AddLineInstruction('CTYARE51')
        RESTRN01(feature, featurePortrayal, contextParameters)
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end
end
