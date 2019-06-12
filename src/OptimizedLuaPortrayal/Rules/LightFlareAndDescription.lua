-- LightFlareAndDescription portrayal rules file.

-- Referenced CSPs.
require 'LITDSN02'

-- Main entry point for feature type.
function LightFlareAndDescription(feature, featurePortrayal, contextParameters, categoryOfLight)
    if feature.PrimitiveType ~= PrimitiveType.Point then
        error(feature.Code .. ' must be of spatial type point')
    end

    -- Colour 12 == magenta

    local colour = { [1] = 12 }

    if feature.colour[1] then
        colour = feature.colour
    end

    local rotation = 135

    if contains(colour[1], { 1, 6, 11 }) then
        -- White, yellow or orange light.  Flare at 45 degrees if there is a colocated non-sectored light.
        for pointAssociation in feature:GetFlattenedSpatialAssociations() do
            local associatedFeatures = pointAssociation.AssociatedFeatures

            for _, af in ipairs(associatedFeatures) do
                if af ~= feature and contains(af.Code, { 'LightAllAround', 'LightAirObstruction', 'LightFogDetector' }) then
                    rotation = 45

                    break
                end
            end
        end
    end

    local symbol = 'LITDEF11'

    if colour[1] == 1 then
        if colour[2] == 3 then
            -- White and red
            symbol = 'LIGHTS11'
        elseif colour[2] == 4 then
            -- White and green
            symbol = 'LIGHTS12'
        else
            -- White, yellow or orange
            symbol = 'LIGHTS13'
        end
    elseif (colour[1] == 5 and colour[2] == 6) then
        -- Blue and yellow
        symbol = 'LIGHTS13'
    elseif colour[1] == 3 then
        -- Red
        symbol = 'LIGHTS11'
    elseif colour[1] == 4 then
        -- Green
        symbol = 'LIGHTS12'
    elseif contains(colour[1], { 11, 6, 1 }) then
        -- White, yellow or orange
        symbol = 'LIGHTS13'
    end

    featurePortrayal:AddPointInstruction(Symbol.CreateSymbol(symbol, rotation))

    local description = LITDSN02(categoryOfLight, feature.rhythmOfLight, feature.colour, feature.height, feature['!valueOfNominalRange'], feature.status)
    local textElement = Text.CreateTextElement(description, defaultFontCharacteristics, 10, 'CHBLK')
    local textPoint

    if rotation == 45 then
        textPoint = Text.CreateTextPoint({ textElement }, Graphics.CreateVector(7.02, 3.51), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Bottom)
    else
        textPoint = Text.CreateTextPoint({ textElement }, Graphics.CreateVector(7.02, 0), nil, nil, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Center)
    end

    featurePortrayal:AddTextInstruction(textPoint, nil, PortrayalModel.CreateDisplayParameters(23, 8))
end
