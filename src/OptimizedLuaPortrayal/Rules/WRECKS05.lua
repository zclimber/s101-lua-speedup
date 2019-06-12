-- WRECKS05 conditional symbology rules file.

-- Referenced CSPs.
require 'QUAPNT02'
require 'SNDFRM04'
require 'UDWHAZ05'

-- Main entry point for CSP.
local Portrayals = Portrayals
local Graphics = Graphics
local PortrayalModel = PortrayalModel
local Symbol = Symbol
local AreaFills = AreaFills
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.WRECKS05(feature, featurePortrayal, contextParameters)
    local DEPTH_VALUE = feature.valueOfSounding or feature.defaultClearanceDepth

    if not DEPTH_VALUE then
        if feature.categoryOfWreck == 1 then
            -- non-dangerous wreck
            DEPTH_VALUE = 20.1
        elseif feature.waterLevelEffect == 3 or feature.waterLevelEffect == 5 then
            -- always under water/submerged OR awash
            DEPTH_VALUE = 0.0
        else
            DEPTH_VALUE = -15.0
        end
    end

    local hazardSymbol = Portrayals.UDWHAZ05(feature, featurePortrayal, contextParameters, DEPTH_VALUE)
    local qualitySymbol = Portrayals.QUAPNT02(feature, featurePortrayal, contextParameters)

    if feature.PrimitiveType == PrimitiveType.Point then
        if hazardSymbol then
            featurePortrayal:AddPointInstruction(hazardSymbol)

            if qualitySymbol then
                featurePortrayal:AddPointInstruction(qualitySymbol, nil, PortrayalModel.CreateDisplayParameters(31011))
            end
        else
            -- Continuation A
            if feature.valueOfSounding then
                if feature.valueOfSounding <= contextParameters.SAFETY_DEPTH then
                    featurePortrayal:AddPointInstruction('DANGER01')
                else
                    featurePortrayal:AddPointInstruction('DANGER02')
                end

                local symbols = Portrayals.SNDFRM04(feature, featurePortrayal, contextParameters, feature.Point, DEPTH_VALUE)

                for _, symbol in ipairs(symbols) do
                    featurePortrayal:AddPointInstruction(symbol)
                end
            else
                local displayParameters = PortrayalModel.CreateDisplayParameters(34050, 4, nil, nil, 'OverRADAR')

                if feature.categoryOfWreck then
                    if feature.categoryOfWreck == 1 and feature.waterLevelEffect == 3 then
                        featurePortrayal:AddPointInstruction('WRECKS04', nil, displayParameters)
                    elseif feature.categoryOfWreck == 2 and feature.waterLevelEffect == 3 then
                        featurePortrayal:AddPointInstruction('WRECKS05', nil, displayParameters)
                    elseif contains(feature.categoryOfWreck, { 4, 5 }) or contains(feature.waterLevelEffect, { 1, 2, 3, 4 }) then
                        featurePortrayal:AddPointInstruction('WRECKS01', nil, displayParameters)
                    else
                        featurePortrayal:AddPointInstruction('WRECKS05', nil, displayParameters)
                    end
                else
                    featurePortrayal:AddPointInstruction('WRECKS05', nil, displayParameters)
                end
            end

            if qualitySymbol then
                featurePortrayal:AddPointInstruction(qualitySymbol, nil, PortrayalModel.CreateDisplayParameters(31011))
            end
        end
    else
        -- Continuation B
        for curveAssociation in feature:GetFlattenedSpatialAssociations() do
            local spatialQuality = curveAssociation.Spatial:GetInformationAssociation('spatialQuality')
            local qualityOfPosition = spatialQuality and spatialQuality.qualityOfPosition

            if qualityOfPosition and qualityOfPosition ~= 1 and qualityOfPosition ~= 10 and qualityOfPosition ~= 11 then
                featurePortrayal:AddLineInstruction('LOWACC41', curveAssociation)
            elseif hazardSymbol then
                featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDot(0.64, 'CHBLK'), curveAssociation)
            elseif feature.valueOfSounding then
                if feature.valueOfSounding <= contextParameters.SAFETY_DEPTH then
                    featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDot(0.64, 'CHBLK'), curveAssociation)
                else
                    featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'CHBLK'), curveAssociation)
                end
            else
                local displayParameters = PortrayalModel.CreateDisplayParameters(34050, 4, nil, nil, 'OverRADAR')

                if feature.waterLevelEffect == 1 or feature.waterLevelEffect == 2 then
                    featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.64, 'CSTLN'), curveAssociation, displayParameters)
                elseif feature.waterLevelEffect == 4 then
                    featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'CSTLN'), curveAssociation, displayParameters)
                else
                    featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDot(0.64, 'CSTLN'), curveAssociation, displayParameters)
                end
            end
        end

        if feature.valueOfSounding then
            if hazardSymbol then
                featurePortrayal:AddPointInstruction(hazardSymbol)
            else
                local symbols = Portrayals.SNDFRM04(feature, featurePortrayal, contextParameters, CreatePoint(0, 0), DEPTH_VALUE)

                for _, symbol in ipairs(symbols) do
                    featurePortrayal:AddPointInstruction(symbol)
                end
            end
        else
            if feature.waterLevelEffect == 1 or feature.waterLevelEffect == 2 then
                featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHBRN'))
            elseif feature.waterLevelEffect == 4 then
                featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('DEPIT'))
            else
                featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('DEPVS'))
            end

            if hazardSymbol then
                featurePortrayal:AddPointInstruction(hazardSymbol)
            end
        end

        if qualitySymbol then
            featurePortrayal:AddPointInstruction(qualitySymbol, nil, PortrayalModel.CreateDisplayParameters(31011))
        end
    end
end
