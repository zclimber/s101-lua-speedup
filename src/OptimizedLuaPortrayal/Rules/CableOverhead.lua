-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.



function Portrayals.CableOverhead(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Curve then
        if feature.radarConspicuous and feature.verticalClearanceSafe and feature.verticalClearanceSafe.verticalClearanceValue then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(1.28, 'CHGRD'))
            featurePortrayal:AddPointInstruction('RACNSP01')
            if feature.verticalClearanceSafe and feature.verticalClearanceSafe.verticalClearanceValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('sfclr %4.1f', feature.verticalClearanceSafe.verticalClearanceValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.radarConspicuous and feature.verticalClearanceSafe and feature.verticalClearanceSafe.verticalClearanceValue then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(1.28, 'CHGRD'))
            featurePortrayal:AddPointInstruction('RACNSP01')
            if feature.verticalClearanceSafe and feature.verticalClearanceSafe.verticalClearanceValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('sfclr %4.1f', feature.verticalClearanceSafe.verticalClearanceValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.radarConspicuous and feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(1.28, 'CHGRD'))
            featurePortrayal:AddPointInstruction('RACNSP01')
            if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.radarConspicuous and feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
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
        elseif feature.radarConspicuous then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(1.28, 'CHGRD'))
            featurePortrayal:AddPointInstruction('RACNSP01')
        elseif feature.verticalClearanceSafe and feature.verticalClearanceSafe.verticalClearanceValue then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(1.28, 'CHGRD'))
            if feature.verticalClearanceSafe and feature.verticalClearanceSafe.verticalClearanceValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('sfclr %4.1f', feature.verticalClearanceSafe.verticalClearanceValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        elseif feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(1.28, 'CHGRD'))
            if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('clr %4.1f', feature.verticalClearanceFixed.verticalClearanceValue), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        else
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(1.28, 'CHGRD'))
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if featurePortrayal:GetInstructionCount() == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
