-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
local Portrayals = Portrayals
local Graphics = Graphics
local PortrayalModel = PortrayalModel
local Symbol = Symbol
local AreaFills = AreaFills
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.LandRegion(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:SetDisplayParameters(21060, 4, nil, nil, 'OverRADAR')
        featurePortrayal:AddPointInstruction('POSGEN04')
        if feature.featureName[1] and feature.featureName[1].name then
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(0, 3.51), nil, nil, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        if feature.categoryOfLandRegion[1] == 2 then
            featurePortrayal:SetDisplayParameters(21060, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction('MARSHES1')
        elseif feature.categoryOfLandRegion[1] == 12 then
            featurePortrayal:SetDisplayParameters(21060, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction('MARSHES1')
        else
            featurePortrayal:SetDisplayParameters(21060, 3, nil, nil, 'UnderRADAR')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(0, 0), nil, nil, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        if feature.categoryOfLandRegion[1] == 2 then
            featurePortrayal:SetDisplayParameters(21060, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction('MARSHES1')
        elseif feature.categoryOfLandRegion[1] == 12 then
            featurePortrayal:SetDisplayParameters(21060, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddAreaInstruction('MARSHES1')
        else
            featurePortrayal:SetDisplayParameters(21060, 3, nil, nil, 'UnderRADAR')
            if feature.featureName[1] and feature.featureName[1].name then
                featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature.featureName[1]['$name'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(0, 0), nil, nil, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Center), nil, PortrayalModel.CreateDisplayParameters(26, 8))
            end
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
