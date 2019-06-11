-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
function Waterfall(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:AddNullInstruction()
    elseif feature.PrimitiveType == PrimitiveType.Curve then
        if feature.visuallyConspicuous then
            featurePortrayal:SetDisplayParameters(32050, 3, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.96, 'CHWHT'))
        else
            featurePortrayal:SetDisplayParameters(32050, 3, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.96, 'CHGRF'))
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
