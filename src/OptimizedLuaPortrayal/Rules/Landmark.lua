-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
local Portrayals = Portrayals
local Graphics = Graphics
local PortrayalModel = PortrayalModel
local Symbol = Symbol
local AreaFills = AreaFills
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.Landmark(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
        if feature.categoryOfLandmark[1] == 15 and feature['function'][1] == 20 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL13')
        elseif feature.categoryOfLandmark[1] == 15 and feature['function'][1] == 21 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL13')
        elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 20 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL13')
        elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 21 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL13')
        elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 31 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TOWERS15')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
        elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 33 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TOWERS03')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
        elseif feature.categoryOfLandmark[1] == 20 and feature['function'][1] == 20 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL13')
        elseif feature.categoryOfLandmark[1] == 20 and feature['function'][1] == 21 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL13')
        elseif feature.categoryOfLandmark[1] == 20 and feature['function'][1] == 26 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL15')
        elseif feature.categoryOfLandmark[1] == 20 and feature['function'][1] == 27 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL15')
        elseif feature.categoryOfLandmark[1] == 1 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('CAIRNS11')
        elseif feature.categoryOfLandmark[1] == 3 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('CHIMNY11')
        elseif feature.categoryOfLandmark[1] == 4 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('DSHAER11')
        elseif feature.categoryOfLandmark[1] == 5 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FLGSTF01')
        elseif feature.categoryOfLandmark[1] == 6 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FLASTK11')
        elseif feature.categoryOfLandmark[1] == 7 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('MSTCON14')
        elseif feature.categoryOfLandmark[1] == 8 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('POSGEN03')
        elseif feature.categoryOfLandmark[1] == 9 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('MONUMT12')
        elseif feature.categoryOfLandmark[1] == 10 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('MONUMT12')
        elseif feature.categoryOfLandmark[1] == 12 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('MONUMT12')
        elseif feature.categoryOfLandmark[1] == 13 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('MONUMT12')
        elseif feature.categoryOfLandmark[1] == 15 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('DOMES011')
        elseif feature.categoryOfLandmark[1] == 16 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('RASCAN11')
        elseif feature.categoryOfLandmark[1] == 17 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TOWERS03')
        elseif feature.categoryOfLandmark[1] == 18 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('WNDMIL12')
        elseif feature.categoryOfLandmark[1] == 19 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('WIMCON11')
        elseif feature.categoryOfLandmark[1] == 20 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('POSGEN03')
        elseif feature.categoryOfLandmark[1] == 15 and feature['function'][1] == 20 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL01')
        elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 20 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL01')
        elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 31 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TOWERS05')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
        elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 33 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TOWERS01')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
        elseif feature.categoryOfLandmark[1] == 20 and feature['function'][1] == 20 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL01')
        elseif feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('POSGEN03')
        elseif feature.categoryOfLandmark[1] == 1 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('CAIRNS01')
        elseif feature.categoryOfLandmark[1] == 3 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('CHIMNY01')
        elseif feature.categoryOfLandmark[1] == 4 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('DSHAER01')
        elseif feature.categoryOfLandmark[1] == 5 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FLGSTF01')
        elseif feature.categoryOfLandmark[1] == 6 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FLASTK01')
        elseif feature.categoryOfLandmark[1] == 7 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('MSTCON04')
        elseif feature.categoryOfLandmark[1] == 8 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('POSGEN03')
        elseif feature.categoryOfLandmark[1] == 9 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('MONUMT02')
        elseif feature.categoryOfLandmark[1] == 10 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('MONUMT02')
        elseif feature.categoryOfLandmark[1] == 12 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('MONUMT02')
        elseif feature.categoryOfLandmark[1] == 13 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('MONUMT02')
        elseif feature.categoryOfLandmark[1] == 15 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('DOMES001')
        elseif feature.categoryOfLandmark[1] == 16 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('RASCAN01')
        elseif feature.categoryOfLandmark[1] == 17 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TOWERS01')
        elseif feature.categoryOfLandmark[1] == 18 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('WNDMIL02')
        elseif feature.categoryOfLandmark[1] == 19 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('WIMCON01')
        elseif feature.categoryOfLandmark[1] == 20 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('POSGEN01')
        else
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('POSGEN01')
        end
    elseif feature.PrimitiveType == PrimitiveType.Point then
        if feature.categoryOfLandmark[1] == 15 and feature['function'][1] == 20 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL13')
        elseif feature.categoryOfLandmark[1] == 15 and feature['function'][1] == 21 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL13')
        elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 20 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL13')
        elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 21 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL13')
        elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 31 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TOWERS15')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, -3.51), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
        elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 33 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TOWERS03')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
        elseif feature.categoryOfLandmark[1] == 20 and feature['function'][1] == 20 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL13')
        elseif feature.categoryOfLandmark[1] == 20 and feature['function'][1] == 21 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL13')
        elseif feature.categoryOfLandmark[1] == 20 and feature['function'][1] == 26 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL15')
        elseif feature.categoryOfLandmark[1] == 20 and feature['function'][1] == 27 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL15')
        elseif feature.categoryOfLandmark[1] == 1 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('CAIRNS11')
        elseif feature.categoryOfLandmark[1] == 3 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('CHIMNY11')
        elseif feature.categoryOfLandmark[1] == 4 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('DSHAER11')
        elseif feature.categoryOfLandmark[1] == 5 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FLGSTF01')
        elseif feature.categoryOfLandmark[1] == 6 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FLASTK11')
        elseif feature.categoryOfLandmark[1] == 7 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('MSTCON14')
        elseif feature.categoryOfLandmark[1] == 8 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('POSGEN03')
        elseif feature.categoryOfLandmark[1] == 9 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('MONUMT12')
        elseif feature.categoryOfLandmark[1] == 10 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('MONUMT12')
        elseif feature.categoryOfLandmark[1] == 12 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('MONUMT12')
        elseif feature.categoryOfLandmark[1] == 13 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('MONUMT12')
        elseif feature.categoryOfLandmark[1] == 15 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('DOMES011')
        elseif feature.categoryOfLandmark[1] == 16 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('RASCAN11')
        elseif feature.categoryOfLandmark[1] == 17 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TOWERS03')
        elseif feature.categoryOfLandmark[1] == 18 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('WNDMIL12')
        elseif feature.categoryOfLandmark[1] == 19 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('WIMCON11')
        elseif feature.categoryOfLandmark[1] == 20 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('POSGEN03')
        elseif feature.categoryOfLandmark[1] == 15 and feature['function'][1] == 20 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL01')
        elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 20 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL01')
        elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 31 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TOWERS05')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, -3.51), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
        elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 33 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TOWERS01')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
        elseif feature.categoryOfLandmark[1] == 20 and feature['function'][1] == 20 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL01')
        elseif feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('POSGEN03')
        elseif feature.categoryOfLandmark[1] == 1 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('CAIRNS01')
        elseif feature.categoryOfLandmark[1] == 3 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('CHIMNY01')
        elseif feature.categoryOfLandmark[1] == 4 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('DSHAER01')
        elseif feature.categoryOfLandmark[1] == 5 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FLGSTF01')
        elseif feature.categoryOfLandmark[1] == 6 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FLASTK01')
        elseif feature.categoryOfLandmark[1] == 7 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('MSTCON04')
        elseif feature.categoryOfLandmark[1] == 8 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('POSGEN03')
        elseif feature.categoryOfLandmark[1] == 9 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('MONUMT02')
        elseif feature.categoryOfLandmark[1] == 10 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('MONUMT02')
        elseif feature.categoryOfLandmark[1] == 12 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('MONUMT02')
        elseif feature.categoryOfLandmark[1] == 13 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('MONUMT02')
        elseif feature.categoryOfLandmark[1] == 15 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('DOMES001')
        elseif feature.categoryOfLandmark[1] == 16 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('RASCAN01')
        elseif feature.categoryOfLandmark[1] == 17 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TOWERS01')
        elseif feature.categoryOfLandmark[1] == 18 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('WNDMIL02')
        elseif feature.categoryOfLandmark[1] == 19 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('WIMCON01')
        elseif feature.categoryOfLandmark[1] == 20 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('POSGEN01')
        else
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('POSGEN01')
        end
    elseif feature.PrimitiveType == PrimitiveType.Curve then
        if feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHBLK'))
        else
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'LANDF'))
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        if feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 33 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHBRN'))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(0, 0), nil, nil, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHBLK'))
        elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 33 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHBRN'))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(0, 0), nil, nil, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'LANDF'))
        elseif feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHBRN'))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHBLK'))
        else
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHBRN'))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'LANDF'))
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        if feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 33 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHBRN'))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(0, 0), nil, nil, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHBLK'))
        elseif feature.categoryOfLandmark[1] == 17 and feature['function'][1] == 33 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHBRN'))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(0, 0), nil, nil, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'LANDF'))
        elseif feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHBRN'))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHBLK'))
        else
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHBRN'))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'LANDF'))
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
