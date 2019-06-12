-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
local Portrayals = Portrayals
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.SweptArea(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        featurePortrayal:SetDisplayParameters(23030, 4, nil, nil, 'UnderRADAR')
        featurePortrayal:AddPointInstruction('SWPARE51')
        featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('swept to %5.1f', feature.depthRangeMinimumValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(0, -3.51), nil, nil, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(27, 8))
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        featurePortrayal:SetDisplayParameters(23030, 4, nil, nil, 'UnderRADAR')
        featurePortrayal:AddPointInstruction('SWPARE51')
        featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('swept to %5.1f', feature.depthRangeMinimumValue), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(0, -3.51), nil, nil, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(27, 8))
        featurePortrayal:AddLineInstruction('NAVARE51')
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
