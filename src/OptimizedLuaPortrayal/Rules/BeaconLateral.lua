-- Converter Version: 0.99.6275.24179

-- Referenced portrayal rules.
require 'TOPMAR01'

-- Main entry point for feature type.
local Portrayals = Portrayals
function Portrayals.BeaconLateral(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
        if feature.colour[1] == 3 and feature.colour[2] == 4 and feature.colour[3] == 3 and feature.beaconShape == 1 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNLAT21')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        elseif feature.colour[1] == 3 and feature.colour[2] == 4 and feature.colour[3] == 3 and feature.beaconShape == 2 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNLAT21')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        elseif feature.colour[1] == 3 and feature.colour[2] == 4 and feature.colour[3] == 3 and feature.beaconShape == 7 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNLAT21')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        elseif feature.colour[1] == 4 and feature.colour[2] == 3 and feature.colour[3] == 4 and feature.beaconShape == 1 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNLAT22')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        elseif feature.colour[1] == 4 and feature.colour[2] == 3 and feature.colour[3] == 4 and feature.beaconShape == 2 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNLAT22')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        elseif feature.colour[1] == 4 and feature.colour[2] == 3 and feature.colour[3] == 4 and feature.beaconShape == 7 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNLAT22')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        elseif feature.colour[1] == 3 and feature.colour[2] == 4 and feature.colour[3] == 3 and feature.beaconShape == 3 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNLAT15')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        elseif feature.colour[1] == 3 and feature.colour[2] == 4 and feature.colour[3] == 3 and feature.beaconShape == 4 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNLAT15')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        elseif feature.colour[1] == 3 and feature.colour[2] == 4 and feature.colour[3] == 3 and feature.beaconShape == 5 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNLAT15')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        elseif feature.colour[1] == 4 and feature.colour[2] == 3 and feature.colour[3] == 4 and feature.beaconShape == 3 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNLAT16')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        elseif feature.colour[1] == 4 and feature.colour[2] == 3 and feature.colour[3] == 4 and feature.beaconShape == 4 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNLAT16')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        elseif feature.colour[1] == 4 and feature.colour[2] == 3 and feature.colour[3] == 4 and feature.beaconShape == 5 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNLAT16')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        elseif feature.colour[1] == 3 and feature.colour[2] == 4 and feature.colour[3] == 3 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNLAT15')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        elseif feature.colour[1] == 4 and feature.colour[2] == 3 and feature.colour[3] == 4 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNLAT16')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        elseif feature.colour[1] == 3 and feature.beaconShape == 1 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNLAT21')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        elseif feature.colour[1] == 3 and feature.beaconShape == 2 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNLAT21')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        elseif feature.colour[1] == 3 and feature.beaconShape == 7 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNLAT21')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        elseif feature.colour[1] == 4 and feature.beaconShape == 1 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNLAT22')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        elseif feature.colour[1] == 4 and feature.beaconShape == 2 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNLAT22')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        elseif feature.colour[1] == 4 and feature.beaconShape == 7 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNLAT22')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        elseif feature.colour[1] == 3 and feature.beaconShape == 3 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNLAT15')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        elseif feature.colour[1] == 3 and feature.beaconShape == 4 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNLAT15')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        elseif feature.colour[1] == 3 and feature.beaconShape == 5 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNLAT15')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        elseif feature.colour[1] == 4 and feature.beaconShape == 3 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNLAT16')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        elseif feature.colour[1] == 4 and feature.beaconShape == 4 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNLAT16')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        elseif feature.colour[1] == 4 and feature.beaconShape == 5 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNLAT16')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        elseif feature.beaconShape == 6 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('CAIRNS11')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        elseif feature.beaconShape == 6 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('CAIRNS01')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        elseif feature.colour[1] == 3 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNLAT15')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        elseif feature.colour[1] == 4 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNLAT16')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        else
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BCNDEF13')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        end
    elseif feature.PrimitiveType == PrimitiveType.Point then
        if feature.beaconShape == 2 and feature.categoryOfLateralMark == 1 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('PRICKE03')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
            TOPMAR01(feature, featurePortrayal, contextParameters, false)
        elseif feature.beaconShape == 2 and feature.categoryOfLateralMark == 2 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('PRICKE04')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
            TOPMAR01(feature, featurePortrayal, contextParameters, false)
        elseif feature.beaconShape == 6 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('CAIRNS11')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
            TOPMAR01(feature, featurePortrayal, contextParameters, false)
        elseif feature.beaconShape == 1 then
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
        elseif feature.beaconShape == 6 then
            featurePortrayal:SetDisplayParameters(27020, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('CAIRNS01')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('bn %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(-3.51, 3.51), nil, nil, Text.HorizontalAlignment.End, Text.VerticalAlignment.Bottom), nil, PortrayalModel.CreateDisplayParameters(21, 8))
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
