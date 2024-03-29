-- Converter Version: 0.99.6275.24179

-- Referenced portrayal rules.
require 'RESTRN01'

-- Main entry point for feature type.
function Fairway(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        if feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 1 then
            featurePortrayal:SetDisplayParameters(26050, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('FAIRWY51', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(7.02, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
            RESTRN01(feature, featurePortrayal, contextParameters)
        elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 2 then
            featurePortrayal:SetDisplayParameters(26050, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('FAIRWY51', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(7.02, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
            RESTRN01(feature, featurePortrayal, contextParameters)
        elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 3 then
            featurePortrayal:SetDisplayParameters(26050, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('FAIRWY51', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(7.02, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
            RESTRN01(feature, featurePortrayal, contextParameters)
        elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 4 then
            featurePortrayal:SetDisplayParameters(26050, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('FAIRWY52', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(7.02, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
            RESTRN01(feature, featurePortrayal, contextParameters)
        else
            featurePortrayal:SetDisplayParameters(26050, 4, nil, nil, 'UnderRADAR')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(7.02, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
            RESTRN01(feature, featurePortrayal, contextParameters)
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        if feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 1 then
            featurePortrayal:SetDisplayParameters(26050, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('FAIRWY51', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(7.02, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
            featurePortrayal:AddLineInstruction('NAVARE51')
            RESTRN01(feature, featurePortrayal, contextParameters)
        elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 2 then
            featurePortrayal:SetDisplayParameters(26050, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('FAIRWY51', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(7.02, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
            featurePortrayal:AddLineInstruction('NAVARE51')
            RESTRN01(feature, featurePortrayal, contextParameters)
        elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 3 then
            featurePortrayal:SetDisplayParameters(26050, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('FAIRWY51', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(7.02, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
            featurePortrayal:AddLineInstruction('NAVARE51')
            RESTRN01(feature, featurePortrayal, contextParameters)
        elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 4 then
            featurePortrayal:SetDisplayParameters(26050, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('FAIRWY52', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(7.02, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
            featurePortrayal:AddLineInstruction('NAVARE51')
            RESTRN01(feature, featurePortrayal, contextParameters)
        else
            featurePortrayal:SetDisplayParameters(26050, 4, nil, nil, 'UnderRADAR')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(7.02, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
            featurePortrayal:AddLineInstruction('NAVARE51')
            RESTRN01(feature, featurePortrayal, contextParameters)
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end
end
