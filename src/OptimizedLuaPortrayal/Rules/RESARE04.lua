-- RESARE04 conditional symbology rules file.

-- Main entry point for CSP.



function Portrayals.RESARE04(feature, featurePortrayal, contextParameters)
    local restriction = feature.restriction
    local categoryOfRestrictedArea = feature.categoryOfRestrictedArea

    if restriction then
        if contains(restriction, { 7, 8, 14 }) then
            -- Continuation A.  Entry restricted or prohibited

            featurePortrayal:SetDisplayParameters(nil, 6)

            if contains(restriction, { 1, 2, 3, 4, 5, 6, 13, 16, 17, 23, 24, 25, 26, 27 }) then
                featurePortrayal:AddPointInstruction("ENTRES61")
            elseif categoryOfRestrictedArea and contains(categoryOfRestrictedArea, { 1, 8, 9, 12, 14, 18, 19, 21, 24, 25, 26 }) then
                featurePortrayal:AddPointInstruction("ENTRES61")
            elseif contains(restriction, { 9, 10, 11, 12, 15, 18, 19, 20, 21, 22 }) then
                featurePortrayal:AddPointInstruction("ENTRES71")
            elseif categoryOfRestrictedArea and contains(categoryOfRestrictedArea, { 4, 5, 6, 7, 10, 20, 22, 23 }) then
                featurePortrayal:AddPointInstruction("ENTRES71")
            else
                featurePortrayal:AddPointInstruction("ENTRES51")
            end

            if contextParameters.PLAIN_BOUNDARIES then
                featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'CHMGD'))
            else
                featurePortrayal:AddLineInstruction('ENTRES51')
            end

        elseif contains(restriction, { 1, 2 }) then
            -- Continuation B.  Anchoring restricted or prohibited

            featurePortrayal:SetDisplayParameters(nil, 6)

            if contains(restriction, { 3, 4, 5, 6, 13, 16, 17, 23, 24, 25, 26, 27 }) then
                featurePortrayal:AddPointInstruction("ACHRES61")
            elseif categoryOfRestrictedArea and contains(categoryOfRestrictedArea, { 1, 8, 9, 12, 14, 18, 19, 21, 24, 25, 26 }) then
                featurePortrayal:AddPointInstruction("ACHRES61")
            elseif contains(restriction, { 9, 10, 11, 12, 15, 18, 19, 20, 21, 22 }) then
                featurePortrayal:AddPointInstruction("ACHRES71")
            elseif categoryOfRestrictedArea and contains(categoryOfRestrictedArea, { 4, 5, 6, 7, 10, 20, 22, 23 }) then
                featurePortrayal:AddPointInstruction("ACHRES71")
            else
                featurePortrayal:AddPointInstruction("ACHRES51")
            end

            if contextParameters.PLAIN_BOUNDARIES then
                featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'CHMGD'))
            else
                featurePortrayal:AddLineInstruction('ACHRES51')
            end

        elseif contains(restriction, { 3, 4, 5, 6, 24 }) then
            -- Continuation C.  Fishing restricted or prohibited

            featurePortrayal:SetDisplayParameters(nil, 6)

            if contains(restriction, { 13, 16, 17, 23, 24, 25, 26, 27 }) then
                featurePortrayal:AddPointInstruction("FSHRES61")
            elseif categoryOfRestrictedArea and contains(categoryOfRestrictedArea, { 1, 8, 9, 12, 14, 18, 19, 21, 24, 25, 26 }) then
                featurePortrayal:AddPointInstruction("FSHRES61")
            elseif contains(restriction, { 9, 10, 11, 12, 15, 18, 19, 20, 21, 22 }) then
                featurePortrayal:AddPointInstruction("FSHRES71")
            elseif categoryOfRestrictedArea and contains(categoryOfRestrictedArea, { 4, 5, 6, 7, 10, 20, 22, 23 }) then
                featurePortrayal:AddPointInstruction("FSHRES71")
            else
                featurePortrayal:AddPointInstruction("FSHRES51")
            end

            if contextParameters.PLAIN_BOUNDARIES then
                featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'CHMGD'))
            else
                featurePortrayal:AddLineInstruction('FSHRES51')
            end

        elseif contains(restriction, { 13, 16, 17, 23, 25, 26, 27 }) then
            -- Continuation D.  Own ship restrictions

            featurePortrayal:SetDisplayParameters(nil, 6)

            if contains(restriction, { 9, 10, 11, 12, 15, 18, 19, 20, 21, 22 }) then
                featurePortrayal:AddPointInstruction("CTYARE71")
            elseif categoryOfRestrictedArea and contains(categoryOfRestrictedArea, { 4, 5, 6, 7, 10, 20, 22, 23 }) then
                featurePortrayal:AddPointInstruction("CTYARE71")
            else
                featurePortrayal:AddPointInstruction("CTYARE51")
            end

            if contextParameters.PLAIN_BOUNDARIES then
                featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'CHMGD'))
            else
                featurePortrayal:AddLineInstruction('CTYARE51')
            end

        else
            if contains(restriction, { 9, 10, 11, 12, 15, 18, 19, 20, 21, 22 }) then
                featurePortrayal:AddPointInstruction('INFARE51')
            else
                featurePortrayal:AddPointInstruction('RSRDEF51')
            end

            if contextParameters.PLAIN_BOUNDARIES then
                featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'CHMGD'))
            else
                featurePortrayal:AddLineInstruction('CTYARE51')
            end
        end
    else
        -- Continuation E.  No restriction applies

        if categoryOfRestrictedArea then
            if contains(categoryOfRestrictedArea, { 1, 8, 9, 12, 14, 18, 19, 21, 24, 25, 26 }) then
                if contains(categoryOfRestrictedArea, { 4, 5, 6, 7, 10, 20, 22, 23 }) then
                    featurePortrayal:AddPointInstruction("CTYARE71")
                else
                    featurePortrayal:AddPointInstruction("CTYARE51")
                end
            else
                if contains(categoryOfRestrictedArea, { 4, 5, 6, 7, 10, 20, 22, 23 }) then
                    featurePortrayal:AddPointInstruction("INFARE51")
                else
                    featurePortrayal:AddPointInstruction("RSRDEF51")
                end
            end
        else
            featurePortrayal:AddPointInstruction("RSRDEF51")
        end

        if contextParameters.PLAIN_BOUNDARIES then
            featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.64, 'CHMGD'))
        else
            featurePortrayal:AddLineInstruction('CTYARE51')
        end
    end
end
