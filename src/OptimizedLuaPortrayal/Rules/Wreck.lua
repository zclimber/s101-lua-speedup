-- Converter Version: 0.99.6275.24179

-- Referenced portrayal rules.
require 'WRECKS05'

-- Main entry point for feature type.
local Portrayals = Portrayals
function Portrayals.Wreck(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
        if feature.categoryOfWreck == 3 and feature.valueOfSounding then
            featurePortrayal:SetDisplayParameters(34051, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FOULGND1')
        elseif feature.categoryOfWreck == 3 then
            featurePortrayal:SetDisplayParameters(34050, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FOULGND1')
        else
            featurePortrayal:SetDisplayParameters(34050, 4, nil, nil, 'OverRADAR')
            Portrayals.WRECKS05(feature, featurePortrayal, contextParameters)
        end
    elseif feature.PrimitiveType == PrimitiveType.Point then
        if feature.categoryOfWreck == 3 and feature.valueOfSounding then
            featurePortrayal:SetDisplayParameters(34051, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FOULGND1')
        elseif feature.categoryOfWreck == 3 then
            featurePortrayal:SetDisplayParameters(34050, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FOULGND1')
        else
            featurePortrayal:SetDisplayParameters(34050, 4, nil, nil, 'OverRADAR')
            Portrayals.WRECKS05(feature, featurePortrayal, contextParameters)
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        if feature.categoryOfWreck == 3 and feature.valueOfSounding then
            featurePortrayal:SetDisplayParameters(34051, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHBLK'))
        elseif feature.categoryOfWreck == 3 then
            featurePortrayal:SetDisplayParameters(34050, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHBLK'))
        else
            featurePortrayal:SetDisplayParameters(34050, 4, nil, nil, 'UnderRADAR')
            Portrayals.WRECKS05(feature, featurePortrayal, contextParameters)
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        if feature.categoryOfWreck == 3 and feature.valueOfSounding then
            featurePortrayal:SetDisplayParameters(34051, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddLineInstruction('NAVARE51')
        elseif feature.categoryOfWreck == 3 then
            featurePortrayal:SetDisplayParameters(34050, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddLineInstruction('NAVARE51')
        else
            featurePortrayal:SetDisplayParameters(34050, 4, nil, nil, 'UnderRADAR')
            Portrayals.WRECKS05(feature, featurePortrayal, contextParameters)
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end
end
