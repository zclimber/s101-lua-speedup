-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.



function Portrayals.PilotBoardingPlace(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:SetDisplayParameters(28010, 6, nil, nil, 'OverRADAR')
        featurePortrayal:AddPointInstruction('PILBOP02')
        if feature.featureName[1] and feature.featureName[1].name then
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('Plt %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51)), nil, PortrayalModel.CreateDisplayParameters(21, 8))
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        featurePortrayal:SetDisplayParameters(28010, 4, nil, nil, 'UnderRADAR')
        featurePortrayal:AddPointInstruction('PILBOP02')
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'TRFCF'))
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        featurePortrayal:SetDisplayParameters(28010, 4, nil, nil, 'UnderRADAR')
        featurePortrayal:AddPointInstruction('PILBOP02')
        featurePortrayal:AddLineInstruction('CTYARE51')
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if featurePortrayal:GetInstructionCount() == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
