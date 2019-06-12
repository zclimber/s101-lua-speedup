-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
local Portrayals = Portrayals
function Portrayals.SmallCraftFacility(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:SetDisplayParameters(38210, 4, nil, nil, 'UnderRADAR')
        featurePortrayal:AddPointInstruction('SMCFAC02')
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        -- Plain and symbolized boundaries use the same symbolization
        featurePortrayal:SetDisplayParameters(38210, 4, nil, nil, 'UnderRADAR')
        featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHBRN'))
        featurePortrayal:AddPointInstruction('SMCFAC02')
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'LANDF'))
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
