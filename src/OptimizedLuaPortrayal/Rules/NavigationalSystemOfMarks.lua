-- NavigationalSystemOfMarks portrayal rules file.

-- UNOFFICIAL:  Rules extracted from S-52 lookup table for M_NSYS.

-- Main entry point for feature type.



function Portrayals.NavigationalSystemOfMarks(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType ~= PrimitiveType.Surface then
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    featurePortrayal:SetDisplayParameters(27040, 4, nil, nil, 'UnderRADAR')
    featurePortrayal:AddLineInstruction('MARSYS51')
end
