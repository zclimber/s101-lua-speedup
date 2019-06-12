-- Converter Version: 0.99.6275.24179

-- Referenced portrayal rules.
require 'DEPCNT03'

-- Main entry point for feature type.



function Portrayals.DepthContour(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Curve then
        featurePortrayal:SetDisplayParameters(33020, 5, nil, nil, 'OverRADAR')
        Portrayals.DEPCNT03(feature, featurePortrayal, contextParameters)
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end
end
