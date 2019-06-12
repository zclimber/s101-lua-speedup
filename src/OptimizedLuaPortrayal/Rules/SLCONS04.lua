-- SLCONS04 conditional symbology rules file.

-- Referenced CSPs.
require 'QUAPNT02'

-- Main entry point for CSP.
local Portrayals = Portrayals
local Graphics = Graphics
local PortrayalModel = PortrayalModel
local Symbol = Symbol
local AreaFills = AreaFills
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.SLCONS04(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        local symbol = Portrayals.QUAPNT02(feature, featurePortrayal, contextParameters)

        if symbol then
            featurePortrayal:AddPointInstruction(symbol, nil, PortrayalModel.CreateDisplayParameters(31011))
        end
    else
        for curveAssociation in feature:GetFlattenedSpatialAssociations() do
            local spatialQuality = curveAssociation.Spatial:GetInformationAssociation('spatialQuality')
            local qualityOfPosition = spatialQuality and spatialQuality.qualityOfPosition

            if qualityOfPosition and qualityOfPosition ~= 1 and qualityOfPosition ~= 10 and qualityOfPosition ~= 11 then
                featurePortrayal:AddLineInstruction('LOWACC21', curveAssociation)
            else
                local condition = feature.condition
                local categoryOfShorelineConstruction = feature.categoryOfShorelineConstruction
                local waterLevelEffect = feature.waterLevelEffect

                if condition == 1 and contains(condition, { 1, 2 }) then
                    featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CSTLN'), curveAssociation)
                elseif contains(categoryOfShorelineConstruction, { 6, 15, 16 }) then
                    featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(1.28, 'CSTLN'), curveAssociation)
                elseif contains(waterLevelEffect, { 3, 4 }) then
                    featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'CSTLN'), curveAssociation)
                else
                    featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.64, 'CSTLN'), curveAssociation)
                end
            end
        end
    end
end
