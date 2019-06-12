-- LightAllAround portrayal rules file.

-- Referenced CSPs.
require 'LightFlareAndDescription'

-- Main entry point for feature type.
local Portrayals = Portrayals
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.LightAllAround(feature, featurePortrayal, contextParameters)
    featurePortrayal:SetDisplayParameters(27070, 8, nil, nil, 'OverRADAR')

    local valueOfNominalRange = feature.valueOfNominalRange or 9.0

    local categoryOfLight = feature.categoryOfLight[1]

    if contains(categoryOfLight, { 8, 11 }) then
        -- Flood or spot light
        featurePortrayal:AddPointInstruction('LIGHTS82')
    elseif categoryOfLight == 9 then
        -- Strip light
        featurePortrayal:AddPointInstruction('LIGHTS81')
    else
        Portrayals.LightFlareAndDescription(feature, featurePortrayal, contextParameters, feature.categoryOfLight[1])
    end
end
