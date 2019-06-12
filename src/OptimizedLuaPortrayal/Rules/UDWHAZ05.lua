-- UDWHAZ05 conditional symbology rules file.

-- Main entry point for CSP.
function UDWHAZ05(feature, featurePortrayal, contextParameters, DEPTH_VALUE)
    if DEPTH_VALUE <= contextParameters.SAFETY_CONTOUR then
        if not feature.surroundingDepth or feature.surroundingDepth >= contextParameters.SAFETY_CONTOUR then
            -- DANGER = true
            if feature.waterLevelEffect == 1 or feature.waterLevelEffect == 2 then
                featurePortrayal:SetDisplayParameters(14050, 8)
            else
                featurePortrayal:SetDisplayParameters(14010, 8, scaminInfinite, nil, 'OverRADAR')
                return 'ISODGR01'
            end
        elseif contextParameters.SHOW_ISOLATED_DANGERS_IN_SHALLOW_WATERS and feature.surroundingDepth >= 0 then
            if feature.waterLevelEffect == 1 or feature.waterLevelEffect == 2 then
                featurePortrayal:SetDisplayParameters(14050, 8)
            else
                featurePortrayal:SetDisplayParameters(14050, 8, nil, nil, 'OverRADAR')
                return 'ISODGR01'
            end
        end
    end
end
