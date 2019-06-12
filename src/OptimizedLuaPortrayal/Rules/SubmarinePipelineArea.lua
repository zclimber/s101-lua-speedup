-- Converter Version: 0.99.6275.24179

-- Referenced portrayal rules.
require 'RESTRN01'

-- Main entry point for feature type.
local Portrayals = Portrayals
function Portrayals.SubmarinePipelineArea(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        -- Simplified and paper chart points use the same symbolization
        featurePortrayal:SetDisplayParameters(34030, 4, nil, nil, 'OverRADAR')
        featurePortrayal:AddPointInstruction('CHINFO07')
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        if feature.categoryOfPipelinePipe[1] == 2 then
            featurePortrayal:SetDisplayParameters(34030, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('INFARE51')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'CHGRD'))
            RESTRN01(feature, featurePortrayal, contextParameters)
        elseif feature.categoryOfPipelinePipe[1] == 3 then
            featurePortrayal:SetDisplayParameters(34030, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('INFARE51')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'CHGRD'))
            RESTRN01(feature, featurePortrayal, contextParameters)
        elseif feature.product[1] == 3 then
            featurePortrayal:SetDisplayParameters(34030, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('INFARE51')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'CHGRD'))
            RESTRN01(feature, featurePortrayal, contextParameters)
        else
            featurePortrayal:SetDisplayParameters(34030, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('INFARE51')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'CHMGD'))
            RESTRN01(feature, featurePortrayal, contextParameters)
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        if feature.categoryOfPipelinePipe[1] == 2 then
            featurePortrayal:SetDisplayParameters(34030, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('INFARE51')
            featurePortrayal:AddLineInstruction('PIPARE61')
            RESTRN01(feature, featurePortrayal, contextParameters)
        elseif feature.categoryOfPipelinePipe[1] == 3 then
            featurePortrayal:SetDisplayParameters(34030, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('INFARE51')
            featurePortrayal:AddLineInstruction('PIPARE61')
            RESTRN01(feature, featurePortrayal, contextParameters)
        elseif feature.product[1] == 3 then
            featurePortrayal:SetDisplayParameters(34030, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('INFARE51')
            featurePortrayal:AddLineInstruction('PIPARE61')
            RESTRN01(feature, featurePortrayal, contextParameters)
        else
            featurePortrayal:SetDisplayParameters(34030, 3, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('INFARE51')
            featurePortrayal:AddLineInstruction('PIPARE51')
            RESTRN01(feature, featurePortrayal, contextParameters)
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end
end
