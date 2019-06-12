-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.



function Portrayals.PipelineSubmarineOnLand(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:AddNullInstruction()
    elseif feature.PrimitiveType == PrimitiveType.Curve then
        if feature.product[1] == 3 then
            featurePortrayal:SetDisplayParameters(34070, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('PIPSOL06')
        elseif feature.categoryOfPipelinePipe[1] == 2 then
            featurePortrayal:SetDisplayParameters(34070, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('PIPSOL06')
        elseif feature.categoryOfPipelinePipe[1] == 3 then
            featurePortrayal:SetDisplayParameters(34070, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('PIPSOL06')
        elseif feature.categoryOfPipelinePipe[1] == 4 then
            featurePortrayal:SetDisplayParameters(34070, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('PIPSOL06')
        elseif feature.categoryOfPipelinePipe[1] == 5 then
            featurePortrayal:SetDisplayParameters(34070, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('PIPSOL06')
        else
            featurePortrayal:SetDisplayParameters(34070, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('PIPSOL05')
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if featurePortrayal:GetInstructionCount() == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
