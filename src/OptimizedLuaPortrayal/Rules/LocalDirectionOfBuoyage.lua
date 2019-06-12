-- LocalDirectionOfBuoyage portrayal rules file.

-- UNOFFICIAL:  Rules extracted from S-52 lookup table for M_NSYS.

-- Main entry point for feature type.
local Portrayals = Portrayals
function Portrayals.LocalDirectionOfBuoyage(feature, featurePortrayal, contextParameters)
    -- TODO: Use any overlapping NavigationalSystemOfMarks.marksNavigationalSystemOf.  See S-52 lookup tables below.
    featurePortrayal:SetDisplayParameters(27040, 4, nil, nil, 'UnderRADAR')

    if feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PLAIN_BOUNDARIES then
        featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('DIRBOY01', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
        featurePortrayal:AddLineInstruction(LineStyles.CreateStandardLineStyleDash(0.32, 'CHGRD'))
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        featurePortrayal:AddPointInstruction(Symbol.CreateSymbol('DIRBOY01', feature.orientation.orientationValue, Graphics.CRSType.Geographic))
        featurePortrayal:AddLineInstruction('NAVARE51')
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end
end
--[[
Plain

"M_NSYS","","LC(MARSYS51)","4","S","STANDARD","27040"
"M_NSYS","MARSYS1ORIENT","SY(DIRBOYA1,ORIENT);LS(DASH,1,CHGRD)","4","S","STANDARD","27040"
"M_NSYS","MARSYS2ORIENT","SY(DIRBOYB1,ORIENT);LS(DASH,1,CHGRD)","4","S","STANDARD","27040"
"M_NSYS","ORIENT","SY(DIRBOY01,ORIENT);LS(DASH,1,CHGRD)","4","S","STANDARD","27040"

Symoblized

"M_NSYS","","LC(MARSYS51)","4","S","STANDARD","27040"
"M_NSYS","MARSYS1ORIENT","SY(DIRBOYA1,ORIENT);LC(NAVARE51)","4","S","STANDARD","27040"
"M_NSYS","MARSYS2ORIENT","SY(DIRBOYB1,ORIENT);LC(NAVARE51)","4","S","STANDARD","27040"
"M_NSYS","ORIENT","SY(DIRBOY01,ORIENT);LC(NAVARE51)","4","S","STANDARD","27040"
--]]
