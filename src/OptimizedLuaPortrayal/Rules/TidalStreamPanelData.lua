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
function Portrayals.TidalStreamPanelData(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:SetDisplayParameters(33060, 4, nil, nil, 'OverRADAR')
        featurePortrayal:AddPointInstruction('TIDSTR01')
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        featurePortrayal:SetDisplayParameters(33060, 2, nil, nil, 'UnderRADAR')
        featurePortrayal:AddPointInstruction('TIDSTR01')
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        featurePortrayal:SetDisplayParameters(33060, 2, nil, nil, 'UnderRADAR')
        featurePortrayal:AddPointInstruction('TIDSTR01')
        featurePortrayal:AddLineInstruction('TIDINF51')
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
