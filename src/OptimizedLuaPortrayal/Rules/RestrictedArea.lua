-- Converter Version: 0.99.6275.24179

-- Referenced portrayal rules.
require 'RESARE04'

-- Main entry point for feature type.
local Portrayals = Portrayals
function Portrayals.RestrictedArea(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        if feature.categoryOfRestrictedArea[1] == 27 then
            featurePortrayal:SetDisplayParameters(26010, 5, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('ESSARE01')
            featurePortrayal:AddLineInstruction('ESSARE01')
        elseif feature.categoryOfRestrictedArea[1] == 28 then
            featurePortrayal:SetDisplayParameters(26010, 5, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('PSSARE01')
            featurePortrayal:AddLineInstruction('ESSARE01')
        else
            featurePortrayal:SetDisplayParameters(26010, 5, nil, nil, 'UnderRADAR')
            RESARE04(feature, featurePortrayal, contextParameters)
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        if feature.categoryOfRestrictedArea[1] == 27 then
            featurePortrayal:SetDisplayParameters(26010, 5, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('ESSARE01')
            featurePortrayal:AddLineInstruction('ESSARE01')
        elseif feature.categoryOfRestrictedArea[1] == 28 then
            featurePortrayal:SetDisplayParameters(26010, 5, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('PSSARE01')
            featurePortrayal:AddLineInstruction('ESSARE01')
        else
            featurePortrayal:SetDisplayParameters(26010, 5, nil, nil, 'UnderRADAR')
            RESARE04(feature, featurePortrayal, contextParameters)
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end
end
