-- Converter Version: 0.99.6275.24179

-- Main entry point for feature type.
local Portrayals = Portrayals
function Portrayals.CableSubmarine(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Curve then
        if feature.categoryOfCable == 6 then
            featurePortrayal:SetDisplayParameters(24010, 6, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHMGD'))
        else
            featurePortrayal:SetDisplayParameters(34070, 3, nil, nil, 'OverRADAR')
            featurePortrayal:AddLineInstruction('CBLSUB06')
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    if #featurePortrayal.DrawingInstructions == 0 then
        featurePortrayal:AddNullInstruction()
    end
end
