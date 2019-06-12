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
function Portrayals.AnchorBerth(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:SetDisplayParameters(26220, 5, nil, nil, 'OverRADAR')
        featurePortrayal:AddPointInstruction('ACHBRT07')
        if feature.featureName[1] and feature.featureName[1].name then
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('Nr %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 0)), nil, PortrayalModel.CreateDisplayParameters(29, 8))
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        -- Plain and symbolized boundaries use the same symbolization
        featurePortrayal:SetDisplayParameters(26220, 5, nil, nil, 'UnderRADAR')
        featurePortrayal:AddPointInstruction('ACHBRT07')
        if feature.featureName[1] and feature.featureName[1].name then
            featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(string.format('Nr %s', feature.featureName[1].name), defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 0)), nil, PortrayalModel.CreateDisplayParameters(29, 8))
        end
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'CHMGF'))
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
