-- DataCoverage portrayal rules file.

-- Main entry point for feature type.



function Portrayals.DataCoverage(feature, featurePortrayal, contextParameters)
    featurePortrayal:SetDisplayParameters(21010, 5, nil, nil, 'UnderRADAR')
    featurePortrayal:AddNullInstruction()
end
