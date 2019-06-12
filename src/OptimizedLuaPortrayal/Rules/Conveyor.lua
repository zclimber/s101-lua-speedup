-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.



function Portrayals.Conveyor(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Curve then
        if feature.categoryOfConveyor == 1 and feature.radarConspicuous then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(1.28, 'CHGRD'))
            featurePortrayal:AddPointInstruction('RACNSP01')
            if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.categoryOfConveyor == 1 and feature.radarConspicuous then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(1.28, 'CHGRD'))
            featurePortrayal:AddPointInstruction('RACNSP01')
            if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.categoryOfConveyor == 2 and feature.radarConspicuous then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.96, 'CHGRD'))
            featurePortrayal:AddPointInstruction('RACNSP01')
            if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.categoryOfConveyor == 2 and feature.radarConspicuous then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.96, 'CHGRD'))
            featurePortrayal:AddPointInstruction('RACNSP01')
            if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.categoryOfConveyor == 1 then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(1.28, 'CHGRD'))
            if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.categoryOfConveyor == 2 then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.96, 'CHGRD'))
            if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.radarConspicuous then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(1.28, 'CHGRD'))
            featurePortrayal:AddPointInstruction('RACNSP01')
            if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.radarConspicuous then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(1.28, 'CHGRD'))
            featurePortrayal:AddPointInstruction('RACNSP01')
            if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        else
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(1.28, 'CHGRD'))
            if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        if feature.radarConspicuous then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('RACNSP01')
            if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 0)), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.96, 'CHGRD'))
        elseif feature.radarConspicuous then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('RACNSP01')
            if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 0)), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.96, 'CHGRD'))
        else
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 0)), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.96, 'CHGRD'))
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        if feature.radarConspicuous then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('RACNSP01')
            if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 0)), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.96, 'CHGRD'))
        elseif feature.radarConspicuous then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('RACNSP01')
            if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 0)), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.96, 'CHGRD'))
        else
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 0)), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.96, 'CHGRD'))
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
