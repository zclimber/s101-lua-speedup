-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
local Portrayals = Portrayals
function Portrayals.Building(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
        if feature['function'][1] == 33 and feature.visuallyConspicuous and feature.featureName[1] and feature.featureName[1].name then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('POSGEN03')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
        elseif feature['function'][1] == 20 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL13')
        elseif feature['function'][1] == 21 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL13')
        elseif feature['function'][1] == 22 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL14')
        elseif feature['function'][1] == 23 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL14')
        elseif feature['function'][1] == 24 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL14')
        elseif feature['function'][1] == 25 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL14')
        elseif feature['function'][1] == 26 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL15')
        elseif feature['function'][1] == 27 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL15')
        elseif feature['function'][1] == 33 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('POSGEN03')
        elseif feature['function'][1] == 35 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TNKCON12')
        elseif feature['function'][1] == 33 and feature.featureName[1] and feature.featureName[1].name then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('POSGEN03')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
        elseif feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUISGL11')
        elseif feature['function'][1] == 20 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL01')
        elseif feature['function'][1] == 21 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL01')
        elseif feature['function'][1] == 22 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL04')
        elseif feature['function'][1] == 23 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL04')
        elseif feature['function'][1] == 24 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL04')
        elseif feature['function'][1] == 25 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL04')
        elseif feature['function'][1] == 26 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL05')
        elseif feature['function'][1] == 27 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL05')
        elseif feature['function'][1] == 33 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('POSGEN03')
        elseif feature['function'][1] == 35 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TNKCON02')
        else
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUISGL01')
        end
    elseif feature.PrimitiveType == PrimitiveType.Point then
        if feature['function'][1] == 33 and feature.visuallyConspicuous and feature.featureName[1] and feature.featureName[1].name then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('POSGEN03')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
        elseif feature['function'][1] == 20 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL13')
        elseif feature['function'][1] == 21 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL13')
        elseif feature['function'][1] == 22 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL14')
        elseif feature['function'][1] == 23 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL14')
        elseif feature['function'][1] == 24 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL14')
        elseif feature['function'][1] == 25 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL14')
        elseif feature['function'][1] == 26 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL15')
        elseif feature['function'][1] == 27 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL15')
        elseif feature['function'][1] == 33 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('POSGEN03')
        elseif feature['function'][1] == 35 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TNKCON12')
        elseif feature['function'][1] == 33 and feature.featureName[1] and feature.featureName[1].name then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('POSGEN03')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
        elseif feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUISGL11')
        elseif feature['function'][1] == 20 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL01')
        elseif feature['function'][1] == 21 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL01')
        elseif feature['function'][1] == 22 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL04')
        elseif feature['function'][1] == 23 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL04')
        elseif feature['function'][1] == 24 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL04')
        elseif feature['function'][1] == 25 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL04')
        elseif feature['function'][1] == 26 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL05')
        elseif feature['function'][1] == 27 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUIREL05')
        elseif feature['function'][1] == 33 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('POSGEN03')
        elseif feature['function'][1] == 35 then
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('TNKCON02')
        else
            featurePortrayal:SetDisplayParameters(32220, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BUISGL01')
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        if feature['function'][1] == 33 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHBRN'))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(0, 0), nil, nil, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHBLK'))
        elseif feature['function'][1] == 33 then
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
        if feature['function'][1] == 33 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHBRN'))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(0, 0), nil, nil, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHBLK'))
        elseif feature['function'][1] == 33 then
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
