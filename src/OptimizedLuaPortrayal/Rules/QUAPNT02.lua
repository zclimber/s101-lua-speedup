-- QUAPNT02 conditional symbology rules file.

-- Main entry point for CSP.
function QUAPNT02(feature, featurePortrayal, contextParameters)
    for spatialAssociation in feature:GetFlattenedSpatialAssociations() do
        local spatialQuality = spatialAssociation.Spatial:GetInformationAssociation('spatialQuality')
        local qualityOfPosition = spatialQuality and spatialQuality.qualityOfPosition

        if qualityOfPosition and qualityOfPosition >= 2 and qualityOfPosition <= 9 then
            return 'LOWACC01'
        end
    end
end
