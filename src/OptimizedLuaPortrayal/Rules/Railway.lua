-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.



function Portrayals.Railway(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Curve then
        featurePortrayal:SetDisplayParameters(32250, 4, nil, nil, 'OverRADAR')
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.64, 'LANDF'))
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if featurePortrayal:GetInstructionCount() == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
