-- Converter Version: 0.99.6275.24179

-- Referenced portrayal rules.
require 'RESTRN01'

-- Main entry point for feature type.
local Portrayals = Portrayals
function Portrayals.MarineFarmCulture(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:SetDisplayParameters(26210, 4, nil, nil, 'OverRADAR')
        featurePortrayal:AddPointInstruction('MARCUL02')
    elseif feature.PrimitiveType == PrimitiveType.Curve then
        featurePortrayal:SetDisplayParameters(26210, 4, nil, nil, 'OverRADAR')
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'CHGRF'))
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        featurePortrayal:SetDisplayParameters(26210, 3, nil, nil, 'UnderRADAR')
        featurePortrayal:AddAreaInstruction('MARCUL02')
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        RESTRN01(feature, featurePortrayal, contextParameters)
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        featurePortrayal:SetDisplayParameters(26210, 3, nil, nil, 'UnderRADAR')
        featurePortrayal:AddAreaInstruction('MARCUL02')
        featurePortrayal:AddLineInstruction('NAVARE51')
        RESTRN01(feature, featurePortrayal, contextParameters)
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end
end
