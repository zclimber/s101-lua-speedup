-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.



function Portrayals.RadarStation(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
        if feature.categoryOfRadarStation[1] == 2 then
            featurePortrayal:SetDisplayParameters(38010, 5, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('RDOSTA02')
            if feature.communicationChannel[1] then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('ch %s', feature.communicationChannel[1]), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(0, 0)), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        else
            featurePortrayal:SetDisplayParameters(38010, 5, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('POSGEN01')
        end
    elseif feature.PrimitiveType == PrimitiveType.Point then
        if feature.categoryOfRadarStation[1] == 2 then
            featurePortrayal:SetDisplayParameters(38010, 5, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('RDOSTA02')
            if feature.communicationChannel[1] then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('ch %s', feature.communicationChannel[1]), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(0, 0)), nil, PortrayalModel.CreateDisplayParameters(11, 8))
            end
        else
            featurePortrayal:SetDisplayParameters(38010, 5, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('POSGEN01')
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
