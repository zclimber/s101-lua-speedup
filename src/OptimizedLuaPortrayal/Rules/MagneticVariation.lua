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
function Portrayals.MagneticVariation(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:SetDisplayParameters(31080, 4, nil, nil, 'OverRADAR')
        featurePortrayal:AddPointInstruction('MAGVAR01')
        featurePortrayal:AddTextInstruction(Text.CreateTextPoint(Text.CreateTextElement(feature['$valueOfMagneticVariation'], defaultFontCharacteristics, 10, 'CHBLK'), Graphics.CreateVector(3.51, 3.51)), nil, PortrayalModel.CreateDisplayParameters(27, 8))
    elseif feature.PrimitiveType == PrimitiveType.Curve then
        featurePortrayal:SetDisplayParameters(31080, 4, nil, nil, 'OverRADAR')
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.64, 'CHMGF'))
        featurePortrayal:AddPointInstruction('MAGVAR51')
        featurePortrayal:AddTextInstruction(Text.CreateTextLine(Text.CreateTextElement(string.format('varn %3.2f', feature.valueOfMagneticVariation), defaultFontCharacteristics, 10, 'CHBLK'), 0.5, nil), nil, PortrayalModel.CreateDisplayParameters(27, 8))
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        -- Plain and symbolized boundaries use the same symbolization
        featurePortrayal:SetDisplayParameters(31080, 4, nil, nil, 'UnderRADAR')
        featurePortrayal:AddPointInstruction('MAGVAR51')
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
