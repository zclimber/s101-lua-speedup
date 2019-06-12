-- Converter Version: 0.99.6275.24179

-- Referenced portrayal rules.
require 'RESTRN01'

-- Main entry point for feature type.



function Portrayals.DeepWaterRoutePart(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        if feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 1 then
            featurePortrayal:SetDisplayParameters(25010, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('TSSLPT51', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddPointInstruction('DWRTPT51')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.96, 'TRFCD'))
            Portrayals.RESTRN01(feature, featurePortrayal, contextParameters)
        elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 2 then
            featurePortrayal:SetDisplayParameters(25010, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('TSSLPT51', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddPointInstruction('DWRTPT51')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.96, 'TRFCD'))
            Portrayals.RESTRN01(feature, featurePortrayal, contextParameters)
        elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 3 then
            featurePortrayal:SetDisplayParameters(25010, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('TSSLPT51', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddPointInstruction('DWRTPT51')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.96, 'TRFCD'))
            Portrayals.RESTRN01(feature, featurePortrayal, contextParameters)
        elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 4 then
            featurePortrayal:SetDisplayParameters(25010, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('DWRUTE51', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddPointInstruction('DWRTPT51')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.96, 'TRFCD'))
            Portrayals.RESTRN01(feature, featurePortrayal, contextParameters)
        else
            featurePortrayal:SetDisplayParameters(25010, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('TSLDEF51')
            featurePortrayal:AddPointInstruction('DWRTPT51')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.96, 'TRFCD'))
            Portrayals.RESTRN01(feature, featurePortrayal, contextParameters)
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        if feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 1 then
            featurePortrayal:SetDisplayParameters(25010, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('TSSLPT51', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddPointInstruction('DWRTPT51')
            featurePortrayal:AddLineInstruction('DWRUTE51')
            Portrayals.RESTRN01(feature, featurePortrayal, contextParameters)
        elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 2 then
            featurePortrayal:SetDisplayParameters(25010, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('TSSLPT51', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddPointInstruction('DWRTPT51')
            featurePortrayal:AddLineInstruction('DWRUTE51')
            Portrayals.RESTRN01(feature, featurePortrayal, contextParameters)
        elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 3 then
            featurePortrayal:SetDisplayParameters(25010, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('TSSLPT51', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddPointInstruction('DWRTPT51')
            featurePortrayal:AddLineInstruction('DWRUTE51')
            Portrayals.RESTRN01(feature, featurePortrayal, contextParameters)
        elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 4 then
            featurePortrayal:SetDisplayParameters(25010, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('DWRUTE51', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddPointInstruction('DWRTPT51')
            featurePortrayal:AddLineInstruction('DWRUTE51')
            Portrayals.RESTRN01(feature, featurePortrayal, contextParameters)
        else
            featurePortrayal:SetDisplayParameters(25010, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('TSLDEF51')
            featurePortrayal:AddPointInstruction('DWRTPT51')
            featurePortrayal:AddLineInstruction('DWRUTE51')
            Portrayals.RESTRN01(feature, featurePortrayal, contextParameters)
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end
end
