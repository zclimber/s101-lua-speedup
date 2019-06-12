-- Converter Version: 0.99.6275.24179

-- Referenced portrayal rules.
require 'OBSTRN07'

-- Main entry point for feature type.
local Portrayals = Portrayals
local Graphics = Graphics
local PortrayalModel = PortrayalModel
local Symbol = Symbol
local AreaFills = AreaFills
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.Obstruction(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SIMPLIFIED_POINTS then
        if feature.categoryOfObstruction == 7 and feature.valueOfSounding then
            featurePortrayal:SetDisplayParameters(34051, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FOULGND1')
        elseif feature.categoryOfObstruction == 8 and feature.valueOfSounding then
            featurePortrayal:SetDisplayParameters(34051, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FLTHAZ02')
        elseif feature.categoryOfObstruction == 9 and feature.valueOfSounding then
            featurePortrayal:SetDisplayParameters(34051, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('ACHARE02')
        elseif feature.categoryOfObstruction == 10 and feature.valueOfSounding then
            featurePortrayal:SetDisplayParameters(34051, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FLTHAZ02')
        elseif feature.categoryOfObstruction == 7 then
            featurePortrayal:SetDisplayParameters(34050, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FOULGND1')
        elseif feature.categoryOfObstruction == 8 then
            featurePortrayal:SetDisplayParameters(34050, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FLTHAZ02')
        elseif feature.categoryOfObstruction == 9 then
            featurePortrayal:SetDisplayParameters(34050, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('ACHARE02')
        elseif feature.categoryOfObstruction == 10 then
            featurePortrayal:SetDisplayParameters(34050, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FLTHAZ02')
        elseif feature.waterLevelEffect == 7 then
            featurePortrayal:SetDisplayParameters(12410, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FLTHAZ02')
        else
            featurePortrayal:SetDisplayParameters(34050, 4, nil, nil, 'OverRADAR')
            Portrayals.OBSTRN07(feature, featurePortrayal, contextParameters)
        end
    elseif feature.PrimitiveType == PrimitiveType.Point then
        if feature.categoryOfObstruction == 7 and feature.valueOfSounding then
            featurePortrayal:SetDisplayParameters(34051, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FOULGND1')
        elseif feature.categoryOfObstruction == 8 and feature.valueOfSounding then
            featurePortrayal:SetDisplayParameters(34051, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FLTHAZ02')
        elseif feature.categoryOfObstruction == 9 and feature.valueOfSounding then
            featurePortrayal:SetDisplayParameters(34051, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('ACHARE02')
        elseif feature.categoryOfObstruction == 10 and feature.valueOfSounding then
            featurePortrayal:SetDisplayParameters(34051, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FLTHAZ02')
        elseif feature.categoryOfObstruction == 7 then
            featurePortrayal:SetDisplayParameters(34050, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FOULGND1')
        elseif feature.categoryOfObstruction == 8 then
            featurePortrayal:SetDisplayParameters(34050, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FLTHAZ02')
        elseif feature.categoryOfObstruction == 9 then
            featurePortrayal:SetDisplayParameters(34050, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('ACHARE02')
        elseif feature.categoryOfObstruction == 10 then
            featurePortrayal:SetDisplayParameters(34050, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FLTHAZ02')
        elseif feature.waterLevelEffect == 7 then
            featurePortrayal:SetDisplayParameters(12410, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FLTHAZ02')
        else
            featurePortrayal:SetDisplayParameters(34050, 4, nil, nil, 'OverRADAR')
            Portrayals.OBSTRN07(feature, featurePortrayal, contextParameters)
        end
    elseif feature.PrimitiveType == PrimitiveType.Curve then
        if feature.categoryOfObstruction == 8 then
            featurePortrayal:SetDisplayParameters(12410, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CSTLN'))
        elseif feature.categoryOfObstruction == 9 then
            featurePortrayal:SetDisplayParameters(12410, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHMGD'))
        elseif feature.categoryOfObstruction == 10 then
            featurePortrayal:SetDisplayParameters(12410, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CSTLN'))
        elseif feature.waterLevelEffect == 7 then
            featurePortrayal:SetDisplayParameters(12410, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CSTLN'))
        else
            featurePortrayal:SetDisplayParameters(34050, 4, nil, nil, 'OverRADAR')
            Portrayals.OBSTRN07(feature, featurePortrayal, contextParameters)
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        if feature.categoryOfObstruction == 7 and feature.valueOfSounding then
            featurePortrayal:SetDisplayParameters(34051, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('FOULGND1')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        elseif feature.categoryOfObstruction == 7 then
            featurePortrayal:SetDisplayParameters(34050, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('FOULGND1')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        elseif feature.categoryOfObstruction == 8 then
            featurePortrayal:SetDisplayParameters(12410, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('FLTHAZ02')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CSTLN'))
        elseif feature.categoryOfObstruction == 9 then
            featurePortrayal:SetDisplayParameters(12410, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('ACHARE02')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHMGD'))
        elseif feature.categoryOfObstruction == 10 then
            featurePortrayal:SetDisplayParameters(12410, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('FLTHAZ02')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CSTLN'))
        elseif feature.waterLevelEffect == 7 then
            featurePortrayal:SetDisplayParameters(12410, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('FLTHAZ02')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CSTLN'))
        else
            featurePortrayal:SetDisplayParameters(34050, 4, nil, nil, 'UnderRADAR')
            Portrayals.OBSTRN07(feature, featurePortrayal, contextParameters)
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        if feature.categoryOfObstruction == 7 and feature.valueOfSounding then
            featurePortrayal:SetDisplayParameters(34051, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('FOULGND1')
            featurePortrayal:AddLineInstruction('NAVARE51')
        elseif feature.categoryOfObstruction == 7 then
            featurePortrayal:SetDisplayParameters(34050, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('FOULGND1')
            featurePortrayal:AddLineInstruction('NAVARE51')
        elseif feature.categoryOfObstruction == 8 then
            featurePortrayal:SetDisplayParameters(12410, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('FLTHAZ02')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CSTLN'))
        elseif feature.categoryOfObstruction == 9 then
            featurePortrayal:SetDisplayParameters(12410, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('ACHARE02')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHMGD'))
        elseif feature.categoryOfObstruction == 10 then
            featurePortrayal:SetDisplayParameters(12410, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('FLTHAZ02')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CSTLN'))
        elseif feature.waterLevelEffect == 7 then
            featurePortrayal:SetDisplayParameters(12410, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('FLTHAZ02')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CSTLN'))
        else
            featurePortrayal:SetDisplayParameters(34050, 4, nil, nil, 'UnderRADAR')
            Portrayals.OBSTRN07(feature, featurePortrayal, contextParameters)
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end
end
