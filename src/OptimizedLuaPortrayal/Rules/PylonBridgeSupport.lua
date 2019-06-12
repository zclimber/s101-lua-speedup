-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
local Portrayals = Portrayals
function Portrayals.PylonBridgeSupport(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:SetDisplayParameters(12210, 8, nil, nil, 'OverRADAR')
        featurePortrayal:AddPointInstruction('POSGEN03')
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        -- Plain and symbolized boundaries use the same symbolization
        featurePortrayal:SetDisplayParameters(12210, 6, nil, nil, 'UnderRADAR')
        featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill('CHBRN'))
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.64, 'CSTLN'))
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
