-- OBSTRN07 conditional symbology rules file.

-- Referenced CSPs.
require 'QUAPNT02'
require 'UDWHAZ05'
require 'SNDFRM04'

-- Main entry point for CSP.
local Portrayals = Portrayals
local Graphics = Graphics
local PortrayalModel = PortrayalModel
local Symbol = Symbol
local AreaFills = AreaFills
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.OBSTRN07(feature, featurePortrayal, contextParameters)
    local DEPTH_VALUE = feature.valueOfSounding or feature.defaultClearanceDepth

    if not DEPTH_VALUE then
        if feature['!categoryOfObstruction'] == 6 or feature.waterLevelEffect == 3 then
            DEPTH_VALUE = 0.01
        elseif feature.waterLevelEffect == 5 then
            DEPTH_VALUE = 0.0
        else
            DEPTH_VALUE = -15.0
        end
    end

    local hazardSymbol = Portrayals.UDWHAZ05(feature, featurePortrayal, contextParameters, DEPTH_VALUE)

    local valueOfSounding = feature.valueOfSounding

    if feature.PrimitiveType == PrimitiveType.Point then
        -- Continuation A
        local qualitySymbol = Portrayals.QUAPNT02(feature, featurePortrayal, contextParameters)

        if hazardSymbol then
            featurePortrayal:AddPointInstruction(hazardSymbol)

            if qualitySymbol then
                featurePortrayal:AddPointInstruction(qualitySymbol, nil, PortrayalModel.CreateDisplayParameters(31011))
            end
        else
            local sounding = false

            if valueOfSounding then
                if valueOfSounding <= contextParameters.SAFETY_DEPTH then
                    if feature.Code == 'UnderwaterAwashRock' then
                        if contains(feature.waterLevelEffect, { 4, 5 }) then
                            featurePortrayal:AddPointInstruction('UWTROC04')
                        else
                            featurePortrayal:AddPointInstruction('DANGER01')
                            sounding = true
                        end
                    else
                        if feature.categoryOfObstruction and feature.categoryOfObstruction == 6 then
                            featurePortrayal:AddPointInstruction('DANGER01')
                            sounding = true
                        elseif contains(feature.waterLevelEffect, { 1, 2 }) then
                            featurePortrayal:AddPointInstruction('OBSTRN11')
                        elseif contains(feature.waterLevelEffect, { 4, 5 }) then
                            featurePortrayal:AddPointInstruction('DANGER03')
                            sounding = true
                        else
                            featurePortrayal:AddPointInstruction('DANGER01')
                            sounding = true
                        end
                    end
                else
                    featurePortrayal:AddPointInstruction('DANGER02')
                    sounding = true
                end
            else
                if feature.Code == 'UnderwaterAwashRock' then
                    if feature.waterLevelEffect == 3 then
                        featurePortrayal:AddPointInstruction('UWTROC03')
                    else
                        featurePortrayal:AddPointInstruction('UWTROC04')
                    end
                else
                    if feature.categoryOfObstruction and feature.categoryOfObstruction == 6 then
                        featurePortrayal:AddPointInstruction('OBSTRN01')
                    elseif contains(feature.waterLevelEffect, { 1, 2 }) then
                        featurePortrayal:AddPointInstruction('OBSTRN11')
                    elseif contains(feature.waterLevelEffect, { 4, 5 }) then
                        featurePortrayal:AddPointInstruction('OBSTRN03')
                    else
                        featurePortrayal:AddPointInstruction('OBSTRN01')
                    end
                end
            end

            if sounding then
                local symbols = Portrayals.SNDFRM04(feature, featurePortrayal, contextParameters, feature.Point, valueOfSounding)

                for _, symbol in ipairs(symbols) do
                    featurePortrayal:AddPointInstruction(symbol)
                end
            end

            if qualitySymbol then
                featurePortrayal:AddPointInstruction(qualitySymbol, nil, PortrayalModel.CreateDisplayParameters(31011))
            end
        end
    elseif feature.PrimitiveType == PrimitiveType.Curve then
        -- Continuation B

        for curveAssociation in feature:GetFlattenedSpatialAssociations() do
            local spatialQuality = curveAssociation.Spatial:GetInformationAssociation('spatialQuality')
            local qualityOfPosition = spatialQuality and spatialQuality.qualityOfPosition

            if qualityOfPosition and qualityOfPosition >= 2 and qualityOfPosition <= 9 then
                if hazardSymbol then
                    featurePortrayal:AddLineInstruction('LOWACC41')
                else
                    featurePortrayal:AddLineInstruction('LOWACC31')
                end
            elseif hazardSymbol or (not valueOfSounding) or (valueOfSounding and valueOfSounding <= contextParameters.SAFETY_DEPTH) then
                featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDot(0.64, 'CHBLK'), curveAssociation)
            else
                featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'CHBLK'), curveAssociation)
            end
        end

        if hazardSymbol then
            local hazardSymbolPlacement = Symbol.CreateSymbol(hazardSymbol, nil, nil, nil, nil, Symbol.CreateLineSymbolPlacement())
            featurePortrayal:AddPointInstruction(hazardSymbolPlacement)
        end

        if valueOfSounding then
            local symbols = Portrayals.SNDFRM04(feature, featurePortrayal, contextParameters, CreatePoint(0, 0), valueOfSounding)

            for _, symbol in ipairs(symbols) do
                local symbolPlacement = Symbol.CreateSymbol(symbol, nil, nil, nil, nil, Symbol.CreateLineSymbolPlacement())
                featurePortrayal:AddPointInstruction(symbolPlacement)
            end
        end
    else
        -- Continuation C
        if hazardSymbol then
            featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('DEPVS'))
            featurePortrayal:AddAreaInstruction('FOULAR01')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDot(0.64, 'CHBLK'))
            featurePortrayal:AddPointInstruction(hazardSymbol)
        elseif valueOfSounding then
            if valueOfSounding <= contextParameters.SAFETY_DEPTH then
                featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDot(0.64, 'CHBLK'))
            else
                featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'CHBLK'))
            end

            local symbols = Portrayals.SNDFRM04(feature, featurePortrayal, contextParameters, CreatePoint(0, 0), valueOfSounding)

            for _, symbol in ipairs(symbols) do
                featurePortrayal:AddPointInstruction(symbol)
            end
        else
            if feature.Code == 'Obstruction' and feature.categoryOfObstruction and feature.categoryOfObstruction == 6 then
                featurePortrayal:AddAreaInstruction('FOULAR01')
                featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDot(0.64, 'CHBLK'))
            elseif contains(feature.waterLevelEffect, { 1, 2 }) then
                featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHBRN'))
                featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.64, 'CSTLN'))
            elseif feature.waterLevelEffect == 4 then
                featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('DEPIT'))
                featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'CSTLN'))
            else
                featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('DEPVS'))
                featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDot(0.64, 'CHBLK'))
            end
        end

        local qualitySymbol = Portrayals.QUAPNT02(feature, featurePortrayal, contextParameters)

        if qualitySymbol then
            featurePortrayal:AddPointInstruction(qualitySymbol, nil, PortrayalModel.CreateDisplayParameters(31011))
        end
    end
end
