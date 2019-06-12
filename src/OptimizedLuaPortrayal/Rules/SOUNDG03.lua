-- SOUNDG03 conditional symbology rules file.

-- Referenced CSPs.
require 'SNDFRM04'

-- Main entry point for CSP.
local Portrayals = Portrayals
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.SOUNDG03(feature, featurePortrayal, contextParameters)
    local points = feature.MultiPoint.Points

    for i, point in ipairs(points) do
        local symbols = Portrayals.SNDFRM04(feature, featurePortrayal, contextParameters, point, point.Z)

        for j, symbol in ipairs(symbols) do
            featurePortrayal:AddAugmentedPoint(Graphics.CreatePoint(point.X, point.Y), symbol)
        end
    end
end
