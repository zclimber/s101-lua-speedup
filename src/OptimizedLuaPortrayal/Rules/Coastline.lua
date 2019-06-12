-- Converter Version: 0.99.6275.24179

-- Referenced portrayal rules.
require 'QUAPOS01'

-- Main entry point for feature type.



function Portrayals.Coastline(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Curve then
        if feature.categoryOfCoastline == 6 then
            featurePortrayal:SetDisplayParameters(12410, 7, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CSTLN'))
        elseif feature.categoryOfCoastline == 7 then
            featurePortrayal:SetDisplayParameters(12410, 7, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CSTLN'))
        elseif feature.categoryOfCoastline == 8 then
            featurePortrayal:SetDisplayParameters(12410, 7, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CSTLN'))
        elseif feature.categoryOfCoastline == 10 then
            featurePortrayal:SetDisplayParameters(12410, 7, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CSTLN'))
        else
            featurePortrayal:SetDisplayParameters(12410, 7, nil, nil, 'OverRADAR')
            Portrayals.QUAPOS01(feature, featurePortrayal, contextParameters)
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end
end
