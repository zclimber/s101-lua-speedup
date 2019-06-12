-- QualityOfBathymetricData portrayal rules file.

-- Main entry point for feature type.
function QualityOfBathymetricData(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType ~= PrimitiveType.Surface then
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    featurePortrayal:SetDisplayParameters(31010, 4, nil, nil, 'UnderRADAR')
    featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'CHGRD'))
end
