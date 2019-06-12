-- Converter Version: 0.99.6275.24179

-- Referenced portrayal rules.
require 'RESTRN01'

-- Main entry point for feature type.
function InshoreTrafficZone(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        featurePortrayal:SetDisplayParameters(25010, 5, nil, nil, 'UnderRADAR')
        featurePortrayal:AddPointInstruction('ITZARE51')
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'TRFCD'))
        RESTRN01(feature, featurePortrayal, contextParameters)
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        featurePortrayal:SetDisplayParameters(25010, 5, nil, nil, 'UnderRADAR')
        featurePortrayal:AddPointInstruction('ITZARE51')
        featurePortrayal:AddLineInstruction('RESARE51')
        RESTRN01(feature, featurePortrayal, contextParameters)
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end
end