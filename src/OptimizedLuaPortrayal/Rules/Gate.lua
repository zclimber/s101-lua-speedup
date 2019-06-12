-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
local Portrayals = Portrayals
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.Gate(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
        if feature.categoryOfGate == 2 then
            featurePortrayal:SetDisplayParameters(22010, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('GATCON04')
        elseif feature.categoryOfGate == 3 then
            featurePortrayal:SetDisplayParameters(32440, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('GATCON04')
        elseif feature.categoryOfGate == 4 then
            featurePortrayal:SetDisplayParameters(32440, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('GATCON03')
        else
            featurePortrayal:SetDisplayParameters(22010, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('GATCON04')
        end
    elseif feature.PrimitiveType == PrimitiveType.Point then
        if feature.categoryOfGate == 2 then
            featurePortrayal:SetDisplayParameters(22010, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('GATCON04')
        elseif feature.categoryOfGate == 3 then
            featurePortrayal:SetDisplayParameters(32440, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('GATCON04')
        elseif feature.categoryOfGate == 4 then
            featurePortrayal:SetDisplayParameters(32440, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('GATCON03')
        else
            featurePortrayal:SetDisplayParameters(22010, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('GATCON04')
        end
    elseif feature.PrimitiveType == PrimitiveType.Curve then
        if feature.categoryOfGate == 2 then
            featurePortrayal:SetDisplayParameters(12410, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.64, 'CSTLN'))
        elseif feature.categoryOfGate == 3 then
            featurePortrayal:SetDisplayParameters(12410, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.64, 'CSTLN'))
            featurePortrayal:AddPointInstruction('GATCON04')
        elseif feature.categoryOfGate == 4 then
            featurePortrayal:SetDisplayParameters(12410, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.64, 'CSTLN'))
            featurePortrayal:AddPointInstruction('GATCON03')
        elseif feature.categoryOfGate == 5 then
            featurePortrayal:SetDisplayParameters(12410, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.64, 'CSTLN'))
        else
            featurePortrayal:SetDisplayParameters(12410, 8, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.64, 'CSTLN'))
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        -- Plain and symbolized boundaries use the same symbolization
        featurePortrayal:SetDisplayParameters(12410, 8, nil, nil, 'UnderRADAR')
        featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHBRN'))
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.64, 'CSTLN'))
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
