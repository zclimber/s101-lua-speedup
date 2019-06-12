-- Converter Version: 0.99.6275.24179

-- Referenced portrayal rules.
require 'TOPMAR01'

-- Main entry point for feature type.
local Portrayals = Portrayals
function Portrayals.BuoySafeWater(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
        featurePortrayal:SetDisplayParameters(27010, 8, nil, nil, 'OverRADAR')
        featurePortrayal:AddPointInstruction('BOYSAW12')
        if feature.featureName[1] and feature.featureName[1].name then
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('by %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
        end
    elseif feature.PrimitiveType == PrimitiveType.Point then
        if feature.buoyShape == 3 then
            featurePortrayal:SetDisplayParameters(27010, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BOYSPH01')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('by %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
            TOPMAR01(feature, featurePortrayal, contextParameters, true)
        elseif feature.buoyShape == 4 then
            featurePortrayal:SetDisplayParameters(27010, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BOYPIL01')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('by %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
            TOPMAR01(feature, featurePortrayal, contextParameters, true)
        elseif feature.buoyShape == 5 then
            featurePortrayal:SetDisplayParameters(27010, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BOYSPR01')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('by %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
            TOPMAR01(feature, featurePortrayal, contextParameters, true)
        elseif feature.buoyShape == 6 then
            featurePortrayal:SetDisplayParameters(27010, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BOYBAR01')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('by %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
            TOPMAR01(feature, featurePortrayal, contextParameters, true)
        elseif feature.buoyShape == 7 then
            featurePortrayal:SetDisplayParameters(27010, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BOYSUP01')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('by %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-7.02, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
            TOPMAR01(feature, featurePortrayal, contextParameters, true)
        elseif feature.buoyShape == 8 then
            featurePortrayal:SetDisplayParameters(27010, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BOYSPR01')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('by %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
            TOPMAR01(feature, featurePortrayal, contextParameters, true)
        else
            featurePortrayal:SetDisplayParameters(27010, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BOYGEN03')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('by %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
            TOPMAR01(feature, featurePortrayal, contextParameters, true)
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end
end
