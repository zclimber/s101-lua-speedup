-- LightSectored portrayal rules file.

local function nmi2metres(nmi)
    return nmi * 1852.0
end

-- Sector values are given from seaward, this function flips them.
local function flipSector(sector)
    if sector < 180.0 then
        return sector + 180.0
    else
        return sector - 180.0
    end
end

-- Main entry point for feature type.
local Portrayals = Portrayals
local Graphics = Graphics
local PortrayalModel = PortrayalModel
local Symbol = Symbol
local AreaFills = AreaFills
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.LightSectored(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType ~= PrimitiveType.Point then
        error('LightSectored must be of spatial type point')
    end

    featurePortrayal:SetDisplayParameters(27070, 8, nil, nil, 'OverRADAR')

    for isc, sectorCharacteristic in ipairs(feature.sectorCharacteristic) do
        for ils, lightSector in ipairs(sectorCharacteristic.lightSector) do
            local valueOfNominalRange = lightSector.valueOfNominalRange or 9.0

            local colour = lightSector.colour
            local sectorColourToken
            local sectorLightSymbol

            if colour[1] == 1 and colour[2] == 3 then
                -- white and red
                sectorColourToken = 'LITRD'
                sectorLightSymbol = 'LIGHTS11'
            elseif colour[1] == 3 then
                -- red
                sectorColourToken = 'LITRD'
                sectorLightSymbol = 'LIGHTS11'
            elseif colour[1] == 1 and colour[2] == 4 then
                -- white and green
                sectorColourToken = 'LITGN'
                sectorLightSymbol = 'LIGHTS12'
            elseif colour[1] == 4 then
                -- green
                sectorColourToken = 'LITGN'
                sectorLightSymbol = 'LIGHTS12'
            elseif colour[1] == 11 or colour[1] == 6 or colour[1] == 1 then
                -- orange or yellow or white
                sectorColourToken = 'LITYW'
                sectorLightSymbol = 'LIGHTS13'
            else
                sectorColourToken = 'CHMGD'
                sectorLightSymbol = 'LITDEF11'
            end

            if lightSector.sectorLimit then
                -- Sectored light.
                local sectorLimit1 = flipSector(lightSector.sectorLimit.sectorLimitOne)
                local sectorLimit2 = flipSector(lightSector.sectorLimit.sectorLimitTwo)

                if sectorLimit2 < sectorLimit1 then
                    sectorLimit2 = sectorLimit2 + 360.0
                end

                -- Draw leg lines

                local leglen
                local crs

                if contextParameters.FULL_SECTORS then
                    leglen = nmi2metres(valueOfNominalRange)
                    crs = Graphics.CRSType.Geographic
                else
                    leglen = 25.0
                    crs = Graphics.CRSType.Local
                end

                featurePortrayal:AddAugmentedRay(sectorLimit1, leglen, LineStyles.CreateStandardLineStyleDash(0.32, 'CHBLK'), crs)
                featurePortrayal:AddAugmentedRay(sectorLimit2, leglen, LineStyles.CreateStandardLineStyleDash(0.32, 'CHBLK'), crs)

                -- Draw sector arcs

                local sector = Graphics.CreateSector(sectorLimit1, sectorLimit2 - sectorLimit1)
                local arc = Graphics.CreateArcByRadius(Graphics.CreatePoint(), lightSector.sectorExtension or 20.0, sector)
                local path = Graphics.CreatePath({ arc })

                local arcLineStyle

                if contains(lightSector.lightVisibility, { 7, 6, 3 }) then
                    arcLineStyle = LineStyles.CreateStandardLineStyleDash(0.32, 'CHBLK')
                else
                    arcLineStyle = LineStyles.CreateStandardLineStyleSolid(0.64, sectorColourToken)

                    featurePortrayal:AddAugmentedPath(path, LineStyles.CreateStandardLineStyleSolid(1.28, 'OUTLW'), Graphics.CRSType.Local)
                end

                featurePortrayal:AddAugmentedPath(path, arcLineStyle, Graphics.CRSType.Local)
            elseif lightSector.directionalCharacter then
                -- Directional light.
                local orientation = flipSector(lightSector.directionalCharacter.orientation.orientationValue)
                local leglen = nmi2metres(valueOfNominalRange)

                featurePortrayal:AddAugmentedRay(orientation, leglen, LineStyles.CreateStandardLineStyleDash(0.32, 'CHBLK'), Graphics.CRSType.Geographic)

                local categoryOfLight = feature.categoryOfLight

                if valueOfNominalRange >= 10.0 and not contains(feature.categoryOfLight, { 5 }) and sectorCharacteristic.lightCharacteristic ~= 12 then
                    local sector = Graphics.CreateSector(0, 360)
                    local arc = Graphics.CreateArcByRadius(Graphics.CreatePoint(), 25.0, sector)
                    local path = Graphics.CreatePath({ arc })

                    featurePortrayal:AddAugmentedPath(path, LineStyles.CreateStandardLineStyleSolid(1.28, 'OUTLW'), Graphics.CRSType.Local)
                    featurePortrayal:AddAugmentedPath(path, LineStyles.CreateStandardLineStyleSolid(0.64, sectorColourToken), Graphics.CRSType.Local)
                else
                    featurePortrayal:AddPointInstruction(Symbol.CreateSymbol(sectorLightSymbol, orientation, Graphics.CRSType.Geographic))
                end

                local textElement = Text.CreateTextElement(string.format('%03.0f deg', lightSector.directionalCharacter.orientation.orientationValue), defaultFontCharacteristics, 10, 'CHBLK')
                local textPoint = Text.CreateTextPoint(textElement, Graphics.CreateVector(10.53, -3.51), nil, nil, nil, Text.VerticalAlignment.Bottom)

                featurePortrayal:AddTextInstruction(textPoint, nil, PortrayalModel.CreateDisplayParameters(23, 8))

                local description = Portrayals.LITDSN02(feature.categoryOfLight[1], sectorCharacteristic, colour, feature.height, lightSector.valueOfNominalRange, feature.status)

                local textElement = Text.CreateTextElement(description, defaultFontCharacteristics, 10, 'CHBLK')
                local textPoint = Text.CreateTextPoint(textElement, Graphics.CreateVector(10.53, -3.51), nil, nil, nil, Text.VerticalAlignment.Center)

                featurePortrayal:AddTextInstruction(textPoint, nil, PortrayalModel.CreateDisplayParameters(23, 8))
            else
                error('Neither sectorLimit nor directionalCharacter was found for lightSector.')
            end
        end
    end
end
