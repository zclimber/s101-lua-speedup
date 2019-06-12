-- QUALIN02 conditional symbology rules file.

-- Main entry point for CSP.
function QUALIN02(feature, featurePortrayal, contextParameters)
    for curveAssociation in feature:GetFlattenedSpatialAssociations() do
        local spatialQuality = curveAssociation.Spatial:GetInformationAssociation('spatialQuality')
        local qualityOfPosition = spatialQuality and spatialQuality.qualityOfPosition

        if qualityOfPosition and qualityOfPosition ~= 1 and qualityOfPosition ~= 10 and qualityOfPosition ~= 11 then
            featurePortrayal:AddLineInstruction('LOWACC21', curveAssociation);
        elseif feature.Code == 'Coastline' then
            if feature.radarConspicuous == 1 then
                featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.96, 'CHMGF'), curveAssociation)
            end

            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CSTLN'), curveAssociation)
        else
            -- Must be LandArea
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleSolid(0.32, 'CSTLN'), curveAssociation)
        end
    end
end
