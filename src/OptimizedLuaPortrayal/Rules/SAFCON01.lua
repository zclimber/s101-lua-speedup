-- SAFCON01 conditional symbology rules file.

-- Main entry point for CSP.



function Portrayals.SAFCON01(feature, featurePortrayal, contextParameters, displayParameters, depth, spatials)
    local symbols = {}

    if depth < 0 or depth > 99999 then
        return {} --unknownValue
    end

    local function add(symbol)
        symbols[#symbols + 1] = 'SAFCON' .. symbol
    end

    local depth, fractional = math.modf(depth)

    fractional = math.floor(fractional * 10.0)

    if contextParameters._Testing_SoundingsAsText then

        local fc = nil
        local fr = nil
        local fontSize = contextParameters._Testing_SoundingsAsText_SizeContourLabels
        local color = 'SNDG1'

        if (depth <= contextParameters.SAFETY_DEPTH) then
            color = 'SNDG2'
        end

        if (contextParameters._Testing_SoundingsAsText_Font ~= "") then
            fr = Text.CreateFontReference(contextParameters._Testing_SoundingsAsText_Font, Text.FontWeight.Light, Text.FontSlant.Italics)
        else
            fc = Text.CreateFontCharacteristics(false, Text.FontProportion.Proportional, Text.FontWeight.Light, Text.FontSlant.Italics)
        end

        if depth < 31 and fractional ~= 0 then
            -- Display contour label with subscript
            if (fr ~= nil) then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine({ Text.CreateTextElement(string.format('%d', depth), fr, fontSize, color) }, 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.End, Text.VerticalAlignment.Center), spatials, displayParameters)
                featurePortrayal:AddTextInstruction(Text.CreateTextLine({ Text.CreateTextElement(string.format('%d', fractional), fr, fontSize * 0.75, color) }, 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Top), spatials, displayParameters)
            else
                featurePortrayal:AddTextInstruction(Text.CreateTextLine({ Text.CreateTextElement(string.format('%d', depth), fc, fontSize, color) }, 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.End, Text.VerticalAlignment.Center), spatials, displayParameters)
                featurePortrayal:AddTextInstruction(Text.CreateTextLine({ Text.CreateTextElement(string.format('%d', fractional), fc, fontSize * 0.75, color) }, 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Start, Text.VerticalAlignment.Top), spatials, displayParameters)
            end
        else
            -- Display contour label as whole number
            if (fr ~= nil) then
                featurePortrayal:AddTextInstruction(Text.CreateTextLine({ Text.CreateTextElement(string.format('%d', depth), fr, fontSize, color) }, 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Center), spatials, displayParameters)
            else
                featurePortrayal:AddTextInstruction(Text.CreateTextLine({ Text.CreateTextElement(string.format('%d', depth), fc, fontSize, color) }, 0.5, nil, Symbol.LinePlacementMode.Relative, Text.HorizontalAlignment.Center, Text.VerticalAlignment.Center), spatials, displayParameters)
            end
        end

    else

        if depth < 10 and fractional ~= 0 then
            add(0 .. depth)
            add(6 .. fractional)
        elseif depth < 10 then
            add(0 .. depth)
        elseif depth < 31 and fractional ~= 0 then
            add(2 .. math.floor(depth / 10.0))
            depth = depth - math.floor(depth / 10.0) * 10
            add(1 .. math.floor(depth))
            add(5 .. fractional)
        elseif depth < 100 then
            add(2 .. math.floor(depth / 10.0))
            depth = depth - math.floor(depth / 10.0) * 10
            add(1 .. math.floor(depth))
            --[[ Manufacturer optional.  No SVGs available for this section
            elseif ...
            --]]
        end

    end
    return symbols
end
