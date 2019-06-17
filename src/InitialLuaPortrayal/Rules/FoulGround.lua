-- FoulGround portrayal rules file.

-- UNOFFICIAL:  Rules extracted from S-52 lookup table for OBSTRN where CATOBS = 7.

-- Main entry point for feature type.
function FoulGround(feature, featurePortrayal, contextParameters)
    if feature.PrimitiveType == PrimitiveType.Point then
        if feature.valueOfSounding then
            featurePortrayal:SetDisplayParameters(34051, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FOULGND1')
        else
            featurePortrayal:SetDisplayParameters(34050, 4, nil, nil, 'OverRADAR')
            featurePortrayal:AddPointInstruction('FOULGND1')
        end
    elseif feature.PrimitiveType == PrimitiveType.Curve then
        error('Not Implemented: No curve symbology defined in S-52 for FoulGround')
    elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        if feature.valueOfSounding then
            featurePortrayal:SetDisplayParameters(34051, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('FOULGND1')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        else
            featurePortrayal:SetDisplayParameters(34050, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('FOULGND1')
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
        end
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        if feature.valueOfSounding then
            featurePortrayal:SetDisplayParameters(34051, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('FOULGND1')
            featurePortrayal:AddLineInstruction('NAVARE51')
        else
            featurePortrayal:SetDisplayParameters(34050, 4, nil, nil, 'UnderRADAR')
            featurePortrayal:AddPointInstruction('FOULGND1')
            featurePortrayal:AddLineInstruction('NAVARE51')
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end
end
