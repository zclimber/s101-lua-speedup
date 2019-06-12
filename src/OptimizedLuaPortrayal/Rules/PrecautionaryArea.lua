-- Converter Version: 0.99.6275.24179

-- Referenced portrayal rules.
require 'RESTRN01'

-- Main entry point for feature type.
function PrecautionaryArea(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:SetDisplayParameters(25010, 5, nil, nil, 'OverRADAR')
        featurePortrayal:AddPointInstruction('PRCARE12')
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        featurePortrayal:SetDisplayParameters(25010, 4, nil, nil, 'UnderRADAR')
        featurePortrayal:AddPointInstruction('PRCARE51')
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'TRFCD'))
        RESTRN01(feature, featurePortrayal, contextParameters)
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        featurePortrayal:SetDisplayParameters(25010, 4, nil, nil, 'UnderRADAR')
        featurePortrayal:AddAreaInstruction('TSSJCT02')
        featurePortrayal:AddPointInstruction('PRCARE51')
        featurePortrayal:AddLineInstruction('PRCARE51')
        RESTRN01(feature, featurePortrayal, contextParameters)
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end
end
