-- DEPARE03 conditional symbology rules file.

-- Referenced CSPs.
require 'RESCSP03'
require 'SAFCON01'
require 'SEABED01'

-- Main entry point for CSP.
local Portrayals = Portrayals
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.DEPARE03(feature, featurePortrayal, contextParameters)
    local depthRangeMinimumValue = feature.depthRangeMinimumValue or -1.0
    local depthRangeMaximumValue = feature.depthRangeMaximumValue or depthRangeMinimumValue + 0.01

    Portrayals.SEABED01(feature, featurePortrayal, contextParameters, depthRangeMinimumValue, depthRangeMaximumValue)

    if feature.Code == 'DredgedArea' then
        featurePortrayal:AddAreaInstruction('DRGARE01')
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRF'))

        if #feature.restriction > 0 then
            Portrayals.RESCSP03(feature, featurePortrayal, contextParameters)
        end
    end

    --for curveAssociation in feature:GetFlattenedSpatialAssociations() do
    --	local associatedFeatures = curveAssociation.AssociatedFeatures
    --
    --	local sharedFeatures = {}
    --
    --	for _, sf in ipairs(associatedFeatures) do
    --		-- Don't include self.
    --		if sf ~= feature then
    --			sharedFeatures[sf.Code] = sf
    --		end
    --	end
    --
    --	local function FirstShared(codeList)
    --		for _, code in ipairs(codeList) do
    --			local shared = sharedFeatures[code]
    --
    --			if shared then
    --				return shared
    --			end
    --		end
    --	end
    --
    --	local safe = false
    --	local unsafe = false
    --	local loc_safety = false
    --
    --	if depthRangeMinimumValue < contextParameters.SAFETY_CONTOUR then
    --		unsafe = true
    --	else
    --		safe = true
    --	end
    --
    --	local sharedDepthContour = sharedFeatures['DepthContour']
    --	local loc_valdco
    --
    --	if sharedDepthContour then
    --		loc_valdco = sharedDepthContour.valueOfDepthContour or 0.0
    --	else
    --		loc_valdco = unknownValue
    --	end
    --
    --	if loc_valdco == contextParameters.SAFETY_CONTOUR then
    --		loc_safety = true
    --	else
    --		local sharedDepthDredgedArea = sharedFeatures['DepthArea'] or sharedFeatures['DredgedArea']
    --
    --		if sharedDepthDredgedArea then
    --			local drval1 = sharedDepthDredgedArea.depthRangeMinimumValue or -1.0
    --
    --			if drval1 < contextParameters.SAFETY_CONTOUR then
    --				unsafe = true
    --			else
    --				safe = true
    --			end
    --		else
    --			local group1Shared = FirstShared{'LandArea', 'UnsurveyedArea', 'DockArea', 'LockBasin'}
    --			local landUnsurvedShared = FirstShared{'LandArea', 'UnsurveyedArea'}
    --			local inlandWaterShared = FirstShared{'River', 'Lake', 'Canal', 'DockArea', 'LockBasin'}
    --			local sharedLinearStructure = FirstShared{'LandArea', 'Gate', 'Dam', 'ShorelineConstruction', 'Causeway'}
    --
    --			-- Only Dam and ShorelineConstruction in S-101 have waterLevelEffect.
    --			local waterLevelEffect = sharedLinearStructure and sharedLinearStructure['!waterLevelEffect']
    --
    --			local watlev = sharedLinearStructure and (waterLevelEffect == nil or contains(waterLevelEffect, {1, 2, 6}))
    --
    --			-- NOTE: S-52 PL 3.4 disagrees with PL 4.0.1 on the inlandWaterShared and watlev.
    --			--       Going with 3.4 since 4.0.1 doesn't apply the proper weight when safe water is
    --			--       next to a land area.
    --			if group1Shared and landUnsurvedShared and (not inlandWaterShared) and watlev then
    --				unsafe = true
    --			end
    --		end
    --	end
    --
    --	if loc_safety or unsafe and safe then
    --		local displayParameters = PortrayalModel.CreateDisplayParameters(13010, 8, nil, nil, 'OverRADAR')
    --
    --		local spatialQuality = curveAssociation.Spatial:GetInformationAssociation('spatialQuality')
    --		local qualityOfPosition = spatialQuality and spatialQuality.qualityOfPosition
    --
    --		if qualityOfPosition and qualityOfPosition ~= 1 and qualityOfPosition ~= 10 and qualityOfPosition ~= 11 then
    --			featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'DEPSC'), curveAssociation, displayParameters)
    --		else
    --			featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.64, 'DEPSC'), curveAssociation, displayParameters)
    --		end
    --
    --		if loc_valdco ~= unknownValue then
    --			displayParameters = PortrayalModel.CreateDisplayParameters(33021, 8, nil, nil, 'OverRADAR')
    --
    --			local symbols = Portrayals.SAFCON01(feature, featurePortrayal, contextParameters, displayParameters, loc_valdco, curveAssociation)
    --
    --			for _, symbolName in ipairs(symbols) do
    --				local symbol = Symbol.CreateSymbol(symbolName, nil, nil, nil, nil, Symbol.CreateLineSymbolPlacement())
    --				featurePortrayal:AddPointInstruction(symbol, curveAssociation, displayParameters)
    --			end
    --		end
    --	end
    --end
end
