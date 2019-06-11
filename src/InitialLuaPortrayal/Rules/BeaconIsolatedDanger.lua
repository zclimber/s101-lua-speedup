-- Converter Version: 0.99.6275.24179

-- Referenced portrayal rules.
require 'TOPMAR01'

-- Main entry point for feature type.
function BeaconIsolatedDanger(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
        featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
        featurePortrayal:AddPointInstruction('BCNISD21')
        if feature.featureName[1] and feature.featureName[1].name then
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
        end
    elseif feature.PrimitiveType == PrimitiveType.Point then
        if feature.beaconShape == 1 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNSTK02')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
            TOPMAR01(feature, featurePortrayal, contextParameters, false)
        elseif feature.beaconShape == 3 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNTOW01')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 7.02), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
            TOPMAR01(feature, featurePortrayal, contextParameters, false)
        elseif feature.beaconShape == 4 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNLTC01')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 7.02), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
            TOPMAR01(feature, featurePortrayal, contextParameters, false)
        elseif feature.beaconShape == 5 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNGEN01')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 7.02), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
            TOPMAR01(feature, featurePortrayal, contextParameters, false)
        elseif feature.beaconShape == 7 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNGEN01')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 7.02), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
            TOPMAR01(feature, featurePortrayal, contextParameters, false)
        else
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNGEN03')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
            TOPMAR01(feature, featurePortrayal, contextParameters, false)
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end
end
