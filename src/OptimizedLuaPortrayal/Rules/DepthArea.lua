-- Converter Version: 0.99.6275.24179

-- Referenced portrayal rules.
require 'DEPARE03'

-- Main entry point for feature type.
local Portrayals = Portrayals
local Graphics = Graphics
local PortrayalModel = PortrayalModel
local Symbol = Symbol
local AreaFills = AreaFills
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.DepthArea(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Curve then
        featurePortrayal:AddNullInstruction()
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        if feature.depthRangeMinimumValue == unknownValue and feature.depthRangeMaximumValue == unknownValue then
            featurePortrayal:SetDisplayParameters(13030, 1, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('NODTA'))
            featurePortrayal:AddAreaInstruction('PRTSUR01')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.64, 'CHGRD'))
        else
            featurePortrayal:SetDisplayParameters(13030, 1, nil, nil, 'UnderRADAR')
            Portrayals.DEPARE03(feature, featurePortrayal, contextParameters)
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        if feature.depthRangeMinimumValue == unknownValue and feature.depthRangeMaximumValue == unknownValue then
            featurePortrayal:SetDisplayParameters(13030, 1, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('NODTA'))
            featurePortrayal:AddAreaInstruction('PRTSUR01')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.64, 'CHGRD'))
        else
            featurePortrayal:SetDisplayParameters(13030, 1, nil, nil, 'UnderRADAR')
            Portrayals.DEPARE03(feature, featurePortrayal, contextParameters)
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end
end
