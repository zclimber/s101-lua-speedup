-- Converter Version: 0.99.6275.24179

-- Referenced portrayal rules.
require 'RESTRN01'

-- Main entry point for feature type.
local Portrayals = Portrayals
local Graphics = Graphics
local PortrayalModel = PortrayalModel
local Symbol = Symbol
local AreaFills = AreaFills
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.TerritorialSeaArea(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Surface then
        -- Plain and symbolized boundaries use the same symbolization
        featurePortrayal:SetDisplayParameters(36050, 2, nil, nil, 'UnderRADAR')
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'CHGRF'))
        Portrayals.RESTRN01(feature, featurePortrayal, contextParameters)
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end
end
