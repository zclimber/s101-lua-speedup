-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
local Portrayals = Portrayals
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.SlopeTopline(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
        if feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('HILTOP11')
        else
            featurePortrayal:SetDisplayParameters(32010, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('HILTOP01')
        end
    elseif feature.PrimitiveType == PrimitiveType.Point then
        if feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22220, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('HILTOP11')
        else
            featurePortrayal:SetDisplayParameters(32010, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('HILTOP01')
        end
    elseif feature.PrimitiveType == PrimitiveType.Curve then
        if feature.categoryOfSlope == 2 and feature.radarConspicuous then
            featurePortrayal:SetDisplayParameters(22210, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHBLK'))
        elseif feature.categoryOfSlope == 6 and feature.radarConspicuous then
            featurePortrayal:SetDisplayParameters(22210, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHBLK'))
        elseif feature.categoryOfSlope == 6 and feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(22210, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHBLK'))
        elseif feature.categoryOfSlope == 2 then
            featurePortrayal:SetDisplayParameters(32010, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHGRD'))
        elseif feature.categoryOfSlope == 6 then
            featurePortrayal:SetDisplayParameters(32010, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CHGRD'))
        else
            featurePortrayal:SetDisplayParameters(32010, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'LANDF'))
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
