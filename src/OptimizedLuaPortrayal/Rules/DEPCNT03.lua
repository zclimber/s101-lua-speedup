-- DEPCNT03 conditional symbology rules file.

-- Referenced CSPs.
require 'SAFCON01'

-- Main entry point for CSP.
local Portrayals = Portrayals
local Graphics = Graphics
local PortrayalModel = PortrayalModel
local Symbol = Symbol
local AreaFills = AreaFills
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.DEPCNT03(feature, featurePortrayal, contextParameters)
    local function GenerateCurves()
        for curveAssociation in feature:GetFlattenedSpatialAssociations() do
            local spatialQuality = curveAssociation.Spatial:GetInformationAssociation('spatialQuality')
            local qualityOfPosition = spatialQuality and spatialQuality.qualityOfPosition

            if qualityOfPosition and qualityOfPosition ~= 1 and qualityOfPosition ~= 10 and qualityOfPosition ~= 11 then
                featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'DEPCN'), curveAssociation)
            else
                featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'DEPCN'), curveAssociation)
            end

        end
    end

    local function GenerateLabels()
        --TODO: Check display priority for contour labels
        local displayParameters = PortrayalModel.CreateDisplayParameters(33022)

        local symbols = Portrayals.SAFCON01(feature, featurePortrayal, contextParameters, displayParameters, feature.valueOfDepthContour or 0.0)
        for i, symbol in ipairs(symbols) do
            featurePortrayal:AddPointInstruction(Symbol.CreateSymbol(symbol, 0.0, Graphics.CRSType.Portrayal, 1.0, Graphics.CreateVector(), Symbol.CreateLineSymbolPlacement()), nil, displayParameters)
        end
    end

    if (feature.valueOfDepthContour ~= contextParameters.SAFETY_CONTOUR) then
        GenerateCurves()
        GenerateLabels()
    else
        featurePortrayal:AddNullInstruction()
    end
end
