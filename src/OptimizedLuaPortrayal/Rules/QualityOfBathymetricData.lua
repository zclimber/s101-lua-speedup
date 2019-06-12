-- QualityOfBathymetricData portrayal rules file.

-- Main entry point for feature type.
local Portrayals = Portrayals
local Graphics = Graphics
local PortrayalModel = PortrayalModel
local Symbol = Symbol
local AreaFills = AreaFills
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.QualityOfBathymetricData(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType ~= PrimitiveType.Surface then
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    featurePortrayal:SetDisplayParameters(31010, 4, nil, nil, 'UnderRADAR')
    featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'CHGRD'))
end
