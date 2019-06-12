-- Default portrayal rules file.  Called when rule file cannot be found.

-- Main entry point for feature type.
function Default(feature, featurePortrayal, contextParameters)
    if (feature.PrimitiveType == PrimitiveType.Point) then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:SetDisplayParameters(21010, 5, nil, nil, 'OverRADAR')
        featurePortrayal:AddPointInstruction('QUESMRK1')
    elseif (feature.PrimitiveType == PrimitiveType.Curve) then
        featurePortrayal:SetDisplayParameters(21010, 5, nil, nil, 'OverRADAR')
        featurePortrayal:AddLineInstruction('QUESMRK1')
    elseif (feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES) then
        featurePortrayal:SetDisplayParameters(21010, 5, nil, nil, 'UnderRADAR')
        featurePortrayal:AddPointInstruction('QUESMRK1')
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHMGD'))
    elseif (feature.PrimitiveType == PrimitiveType.Surface) then
        featurePortrayal:SetDisplayParameters(21010, 5, nil, nil, 'UnderRADAR')
        featurePortrayal:AddPointInstruction('QUESMRK1')
        featurePortrayal:AddLineInstruction('QUESMRK1')
        --else
        --	error('Invalid primitive type "' .. feature.PrimitiveType.Name .. '" passed to portrayal.')
    end
end
