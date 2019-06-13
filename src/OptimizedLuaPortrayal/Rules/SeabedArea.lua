-- Main entry point for feature type.



function Portrayals.SeabedArea(feature, featurePortrayal, contextParameters)
    local function AddNatureOfSurfaceText(feature, featurePortrayal)
        local natureOfSurfaceAbbrev = {
            [1] = 'M',
            [2] = 'Cy',
            [3] = 'Si',
            [4] = 'S',
            [5] = 'St',
            [6] = 'G',
            [7] = 'P',
            [8] = 'Cb',
            [9] = 'R',
            [11] = 'R',
            [14] = 'Co',
            [17] = 'Sh',
            [18] = 'R'
        }

        if feature.surfaceCharacteristics then
            local text

            for _, surfaceCharacteristic in ipairs(feature.surfaceCharacteristics) do
                if surfaceCharacteristic.natureOfSurface then
                    if text then
                        text = text .. ' ' .. natureOfSurfaceAbbrev[surfaceCharacteristic.natureOfSurface]
                    else
                        text = natureOfSurfaceAbbrev[surfaceCharacteristic.natureOfSurface]
                    end
                end
            end

            if text then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(text, defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(0, 0), nil, nil, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(25, 8))
            end
        end
    end

    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:SetDisplayParameters(34010, 4, nil, nil, 'OverRADAR')
        AddNatureOfSurfaceText(feature, featurePortrayal)
    elseif feature.PrimitiveType == PrimitiveType.Curve then
        featurePortrayal:SetDisplayParameters(34010, 4, nil, nil, 'OverRADAR')
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHGRD'))
        AddNatureOfSurfaceText(feature, featurePortrayal)
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        if feature.waterLevelEffect == 3 and feature.surfaceCharacteristics[1] and feature.surfaceCharacteristics[1].natureOfSurface then
            featurePortrayal:SetDisplayParameters(34010, 3, nil, nil, 'UnderRADAR')
            AddNatureOfSurfaceText(feature, featurePortrayal)
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        elseif feature.waterLevelEffect == 4 and feature.surfaceCharacteristics[1] and feature.surfaceCharacteristics[1].natureOfSurface == 9 then
            featurePortrayal:SetDisplayParameters(34010, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction('RCKLDG01')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        elseif feature.waterLevelEffect == 4 and feature.surfaceCharacteristics[1] and feature.surfaceCharacteristics[1].natureOfSurface == 11 then
            featurePortrayal:SetDisplayParameters(34010, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction('RCKLDG01')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        elseif feature.waterLevelEffect == 4 and feature.surfaceCharacteristics[1] and feature.surfaceCharacteristics[1].natureOfSurface == 14 then
            featurePortrayal:SetDisplayParameters(34010, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction('RCKLDG01')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        elseif feature.waterLevelEffect == 4 and feature.surfaceCharacteristics[1] and feature.surfaceCharacteristics[1].natureOfSurface then
            featurePortrayal:SetDisplayParameters(34010, 3, nil, nil, 'UnderRADAR')
            AddNatureOfSurfaceText(feature, featurePortrayal)
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        else
            featurePortrayal:SetDisplayParameters(34010, 3, nil, nil, 'OverRADAR')
            AddNatureOfSurfaceText(feature, featurePortrayal)
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        if feature.waterLevelEffect == 3 and feature.surfaceCharacteristics[1] and feature.surfaceCharacteristics[1].natureOfSurface then
            featurePortrayal:SetDisplayParameters(34010, 3, nil, nil, 'UnderRADAR')
            AddNatureOfSurfaceText(feature, featurePortrayal)
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        elseif feature.waterLevelEffect == 4 and feature.surfaceCharacteristics[1] and feature.surfaceCharacteristics[1].natureOfSurface == 9 then
            featurePortrayal:SetDisplayParameters(34010, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction('RCKLDG01')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        elseif feature.waterLevelEffect == 4 and feature.surfaceCharacteristics[1] and feature.surfaceCharacteristics[1].natureOfSurface == 11 then
            featurePortrayal:SetDisplayParameters(34010, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction('RCKLDG01')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        elseif feature.waterLevelEffect == 4 and feature.surfaceCharacteristics[1] and feature.surfaceCharacteristics[1].natureOfSurface == 14 then
            featurePortrayal:SetDisplayParameters(34010, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction('RCKLDG01')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        elseif feature.waterLevelEffect == 4 and feature.surfaceCharacteristics[1] and feature.surfaceCharacteristics[1].natureOfSurface then
            featurePortrayal:SetDisplayParameters(34010, 3, nil, nil, 'UnderRADAR')
            AddNatureOfSurfaceText(feature, featurePortrayal)
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        else
            featurePortrayal:SetDisplayParameters(34010, 3, nil, nil, 'OverRADAR')
            AddNatureOfSurfaceText(feature, featurePortrayal)
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if featurePortrayal:GetInstructionCount() == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
