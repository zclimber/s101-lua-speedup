-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
local Portrayals = Portrayals
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.Vegetation(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
        if feature.categoryOfVegetation == 7 then
            featurePortrayal:SetDisplayParameters(32030, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('TREPNT05')
        elseif feature.categoryOfVegetation == 21 then
            featurePortrayal:SetDisplayParameters(32030, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('TREPNT05')
        else
            featurePortrayal:SetDisplayParameters(32030, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('TREPNT04')
        end
    elseif feature.PrimitiveType == PrimitiveType.Point then
        if feature.categoryOfVegetation == 7 then
            featurePortrayal:SetDisplayParameters(32030, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('TREPNT05')
        elseif feature.categoryOfVegetation == 21 then
            featurePortrayal:SetDisplayParameters(32030, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('TREPNT05')
        else
            featurePortrayal:SetDisplayParameters(32030, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('TREPNT04')
        end
    elseif feature.PrimitiveType == PrimitiveType.Curve then
        featurePortrayal:SetDisplayParameters(32030, 3, nil, nil, 'OverRADAR')
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'LANDF'))
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        if feature.categoryOfVegetation == 7 then
            featurePortrayal:SetDisplayParameters(32030, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction('VEGATN04')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'LANDF'))
        elseif feature.categoryOfVegetation == 21 then
            featurePortrayal:SetDisplayParameters(32030, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction('VEGATN04')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'LANDF'))
        else
            featurePortrayal:SetDisplayParameters(32030, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction('VEGATN03')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'LANDF'))
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        if feature.categoryOfVegetation == 7 then
            featurePortrayal:SetDisplayParameters(32030, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction('VEGATN04')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'LANDF'))
        elseif feature.categoryOfVegetation == 21 then
            featurePortrayal:SetDisplayParameters(32030, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction('VEGATN04')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'LANDF'))
        else
            featurePortrayal:SetDisplayParameters(32030, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction('VEGATN03')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'LANDF'))
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
