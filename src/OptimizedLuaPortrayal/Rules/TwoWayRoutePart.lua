-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
local Portrayals = Portrayals
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.TwoWayRoutePart(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        if feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 1 then
            featurePortrayal:SetDisplayParameters(25010, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('TWRTPT53', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(1.28, 'TRFCD'))
        elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 2 then
            featurePortrayal:SetDisplayParameters(25010, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('TWRTPT53', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(1.28, 'TRFCD'))
        elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 3 then
            featurePortrayal:SetDisplayParameters(25010, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('TWRTPT53', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(1.28, 'TRFCD'))
        elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 4 then
            featurePortrayal:SetDisplayParameters(25010, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('TWRTPT52', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(1.28, 'TRFCD'))
        else
            featurePortrayal:SetDisplayParameters(25010, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('TWRDEF51')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(1.28, 'TRFCD'))
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        if feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 1 then
            featurePortrayal:SetDisplayParameters(25010, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('TWRTPT53', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddLineInstruction('CTYARE51')
        elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 2 then
            featurePortrayal:SetDisplayParameters(25010, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('TWRTPT53', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddLineInstruction('CTYARE51')
        elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 3 then
            featurePortrayal:SetDisplayParameters(25010, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('TWRTPT53', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddLineInstruction('CTYARE51')
        elseif feature.orientation and feature.orientation.orientationValue and feature.trafficFlow == 4 then
            featurePortrayal:SetDisplayParameters(25010, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('TWRTPT52', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
            featurePortrayal:AddLineInstruction('CTYARE51')
        else
            featurePortrayal:SetDisplayParameters(25010, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('TWRDEF51')
            featurePortrayal:AddLineInstruction('CTYARE51')
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
