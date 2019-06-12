-- Converter Version: 0.99.6275.24179

-- Referenced portrayal rules.
require 'RESTRN01'

-- Main entry point for feature type.
function TrafficSeparationSchemeRoundabout(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        featurePortrayal:SetDisplayParameters(25010, 6, nil, nil, 'UnderRADAR')
        featurePortrayal:AddPointInstruction('TSSRON51')
        RESTRN01(feature, featurePortrayal, contextParameters)
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        featurePortrayal:SetDisplayParameters(25010, 6, nil, nil, 'UnderRADAR')
        featurePortrayal:AddAreaInstruction('TSSJCT02')
        featurePortrayal:AddPointInstruction('TSSRON51')
        RESTRN01(feature, featurePortrayal, contextParameters)
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end
end
