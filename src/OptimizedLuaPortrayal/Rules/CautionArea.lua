-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
local Portrayals = Portrayals
function Portrayals.CautionArea(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:SetDisplayParameters(26150, 4, nil, nil, 'OverRADAR')
        featurePortrayal:AddPointInstruction('CHINFO06')
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        featurePortrayal:SetDisplayParameters(26150, 3, nil, nil, 'UnderRADAR')
        featurePortrayal:AddPointInstruction('CTNARE51')
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'TRFCD'))
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        featurePortrayal:SetDisplayParameters(26150, 3, nil, nil, 'UnderRADAR')
        featurePortrayal:AddPointInstruction('CTNARE51')
        featurePortrayal:AddLineInstruction('CTNARE51')
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
