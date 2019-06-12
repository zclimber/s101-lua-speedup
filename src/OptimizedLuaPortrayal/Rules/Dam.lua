-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
local Portrayals = Portrayals
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.Dam(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
        if feature.categoryOfDam == 3 then
            featurePortrayal:SetDisplayParameters(22010, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('CHINFO06')
        else
            featurePortrayal:AddNullInstruction()
        end
    elseif feature.PrimitiveType == PrimitiveType.Point then
        if feature.categoryOfDam == 3 then
            featurePortrayal:SetDisplayParameters(22010, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('CHINFO06')
        else
            featurePortrayal:AddNullInstruction()
        end
    elseif feature.PrimitiveType == PrimitiveType.Curve then
        if feature.categoryOfDam == 3 then
            featurePortrayal:SetDisplayParameters(12410, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.64, 'CSTLN'))
        else
            featurePortrayal:SetDisplayParameters(22010, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(1.28, 'LANDF'))
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        if feature.categoryOfDam == 3 then
            featurePortrayal:SetDisplayParameters(12410, 6, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHBRN'))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.64, 'CSTLN'))
        else
            featurePortrayal:SetDisplayParameters(22010, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHBRN'))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'LANDF'))
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        if feature.categoryOfDam == 3 then
            featurePortrayal:SetDisplayParameters(12410, 6, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHBRN'))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.64, 'CSTLN'))
        else
            featurePortrayal:SetDisplayParameters(22010, 3, nil, nil, 'UnderRADAR')
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
