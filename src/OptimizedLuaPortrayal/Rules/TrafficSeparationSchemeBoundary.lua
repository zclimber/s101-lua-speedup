-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
local Portrayals = Portrayals
function Portrayals.TrafficSeparationSchemeBoundary(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Curve then
        featurePortrayal:SetDisplayParameters(25010, 7, nil, nil, 'OverRADAR')
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(1.28, 'TRFCD'))
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
