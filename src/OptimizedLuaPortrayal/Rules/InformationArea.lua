-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
local Portrayals = Portrayals
function Portrayals.InformationArea(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:SetDisplayParameters(31020, 4, nil, nil, 'OverRADAR')
        featurePortrayal:AddPointInstruction('CHINFO07')
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        -- Plain and symbolized boundaries use the same symbolization
        featurePortrayal:SetDisplayParameters(31020, 4, nil, nil, 'UnderRADAR')
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'CHGRD'))
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
