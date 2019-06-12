-- DepthNoBottomFound conditional symbology rules file.

-- UNOFFICIAL:  Rules extracted from S-52 rules for soundings with a qualityOfSoundingMeasurement of 5 - no bottom found at value shown.

-- Referenced CSPs.
require 'SNDFRM04'

-- Main entry point for CSP.
local Portrayals = Portrayals
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.DepthNoBottomFound(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.MultiPoint then
        featurePortrayal:SetDisplayParameters(33010, 6, nil, nil, 'OverRADAR')
        local points = feature.MultiPoint.Points

        for i, point in ipairs(points) do
            local symbols = Portrayals.SNDFRM04(feature, featurePortrayal, contextParameters, point, point.Z)

            for j, symbol in ipairs(symbols) do
                featurePortrayal:AddAugmentedPoint(Graphics.CreatePoint(point.X, point.Y), symbol)
            end
        end
    elseif feature.PrimitiveType == PrimitiveType.Point then
        featurePortrayal:SetDisplayParameters(33010, 6, nil, nil, 'OverRADAR')
        local point = feature.Point

        local symbols = Portrayals.SNDFRM04(feature, featurePortrayal, contextParameters, point, point.Z)

        for j, symbol in ipairs(symbols) do
            featurePortrayal:AddAugmentedPoint(Graphics.CreatePoint(point.X, point.Y), symbol)
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end
end
