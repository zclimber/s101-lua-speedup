-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
function Bridge(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:AddNullInstruction()
    elseif feature.PrimitiveType == PrimitiveType.Curve then
        if feature.categoryOfBridge == 2 then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(1.6, 'CHGRD'))
            featurePortrayal:AddPointInstruction('BRIDGE01')
        elseif feature.categoryOfBridge == 3 then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(1.6, 'CHGRD'))
            featurePortrayal:AddPointInstruction('BRIDGE01')
        elseif feature.categoryOfBridge == 4 then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(1.6, 'CHGRD'))
            featurePortrayal:AddPointInstruction('BRIDGE01')
        elseif feature.categoryOfBridge == 5 then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(1.6, 'CHGRD'))
            featurePortrayal:AddPointInstruction('BRIDGE01')
        elseif feature.categoryOfBridge == 7 then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(1.6, 'CHGRD'))
            featurePortrayal:AddPointInstruction('BRIDGE01')
        elseif feature.categoryOfBridge == 8 then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(1.6, 'CHGRD'))
            featurePortrayal:AddPointInstruction('BRIDGE01')
        else
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(1.6, 'CHGRD'))
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        if feature.categoryOfBridge == 2 then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BRIDGE01')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(1.28, 'CHGRD'))
        elseif feature.categoryOfBridge == 3 then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BRIDGE01')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(1.28, 'CHGRD'))
        elseif feature.categoryOfBridge == 4 then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BRIDGE01')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(1.28, 'CHGRD'))
        elseif feature.categoryOfBridge == 5 then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BRIDGE01')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(1.28, 'CHGRD'))
        elseif feature.categoryOfBridge == 7 then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BRIDGE01')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(1.28, 'CHGRD'))
        elseif feature.categoryOfBridge == 8 then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BRIDGE01')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(1.28, 'CHGRD'))
        else
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 0)), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(1.28, 'CHGRD'))
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        if feature.categoryOfBridge == 2 then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BRIDGE01')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(1.28, 'CHGRD'))
        elseif feature.categoryOfBridge == 3 then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BRIDGE01')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(1.28, 'CHGRD'))
        elseif feature.categoryOfBridge == 4 then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BRIDGE01')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(1.28, 'CHGRD'))
        elseif feature.categoryOfBridge == 5 then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BRIDGE01')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(1.28, 'CHGRD'))
        elseif feature.categoryOfBridge == 7 then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BRIDGE01')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(1.28, 'CHGRD'))
        elseif feature.categoryOfBridge == 8 then
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('BRIDGE01')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(1.28, 'CHGRD'))
        else
            featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 0)), nil, PortrayalModel.CreateDisplayParameters(21, 8))
            end
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(1.28, 'CHGRD'))
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
