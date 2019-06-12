-- SEABED01 conditional symbology rules file.

-- Main entry point for CSP.
local Portrayals = Portrayals
local Graphics = Graphics
local PortrayalModel = PortrayalModel
local Symbol = Symbol
local AreaFills = AreaFills
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.SEABED01(feature, featurePortrayal, contextParameters, depthRangeMinimumValue, depthRangeMaximumValue)
    local Colour = 'DEPIT'
    local Shallow = true

    if (contextParameters.TWO_SHADES) then
        if (depthRangeMinimumValue >= 0.0 and depthRangeMaximumValue > 0) then
            Colour = 'DEPVS'
        end

        if (depthRangeMinimumValue >= contextParameters.SAFETY_CONTOUR and depthRangeMaximumValue > contextParameters.SAFETY_CONTOUR) then
            Colour = 'DEPDW'
            Shallow = false
        end
    else
        if (depthRangeMinimumValue >= 0.0 and depthRangeMaximumValue > 0) then
            Colour = 'DEPVS'
        end

        if (depthRangeMinimumValue >= contextParameters.SHALLOW_CONTOUR and depthRangeMaximumValue > contextParameters.SHALLOW_CONTOUR) then
            Colour = 'DEPMS'
        end

        if (depthRangeMinimumValue >= contextParameters.SAFETY_CONTOUR and depthRangeMaximumValue > contextParameters.SAFETY_CONTOUR) then
            Colour = 'DEPMD'
            Shallow = false
        end

        if (depthRangeMinimumValue >= contextParameters.DEEP_CONTOUR and depthRangeMaximumValue > contextParameters.DEEP_CONTOUR) then
            Colour = 'DEPDW'
            Shallow = false
        end
    end

    --Debug.Trace('SEABED01: Colour = ' .. Colour .. ' SAFETY_CONTOUR = ' .. contextParameters.SAFETY_CONTOUR .. ' depthRangeMinimumValue = ' .. depthRangeMinimumValue .. ' depthRangeMaximumValue = ' .. depthRangeMaximumValue)

    featurePortrayal:AddAreaInstruction(AreaFills.CreateColorFill(Colour))

    if (contextParameters.SHALLOW_PATTERN and Shallow) then
        featurePortrayal:AddAreaInstruction('DIAMOND1')
    end
end
