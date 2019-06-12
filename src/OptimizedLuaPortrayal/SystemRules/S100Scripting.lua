--[[
This file contains the global functions and tables that define the S-100 Lua Scripting Model.
These functions are intended to be called by the S-100 scripts.
--]]

--
-- Type system support
--

local typeSystemChecksEnabled

function TypeSystemChecks(enabled)
    if typeSystemChecksEnabled == enabled then
        return false
    end

    typeSystemChecksEnabled = enabled

    if enabled then
        function CheckSelf(object, typeName, errorDepth)
            local objectType = type(object)

            if objectType == 'table' and object.Type == typeName then
                return
            end

            error('Function call on object of type ' .. typeName .. ' was not in the form of "object:function()"', errorDepth or 3)
        end

        function CheckNotSelf(object, typeName, errorDepth)
            local objectType = type(object)

            if objectType == 'table' and object.Type == typeName then
                error('Function call on object of type ' .. typeName .. ' was not in the form of "object.function()"', errorDepth or 3)
            end
        end

        function CheckType(object, typeName, errorDepth)
            local objectType = type(object)
            local colon = string.find(typeName, ':')

            if objectType == 'table' and colon then
                local highType = string.sub(typeName, 1, colon - 1)
                typeName = string.sub(typeName, colon + 1)

                if highType ~= 'array' and highType ~= 'array+' then
                    error('Unrecognized high type "' .. highType '"', errorDepth or 3)
                end

                -- 'array' allows for empty arrays, 'array+' doesn't.
                if #object ~= 0 or highType == 'array+' then
                    CheckType(object[1], typeName, (errorDepth or 3) + 1)
                end
            elseif objectType ~= 'table' then
                if objectType ~= typeName then
                    error('Object given is of type "' .. objectType .. '" not of type "' .. typeName .. '"', errorDepth or 3)
                end
            elseif object == nil or object.Type ~= typeName then
                error('Object given is of type "' .. objectType .. '" not of type "' .. typeName .. '"', errorDepth or 3)
            end
        end

        function CheckTypeOrNil(object, typeName, errorDepth)
            if object ~= nil then
                errorDepth = errorDepth or 3

                CheckType(object, typeName, errorDepth + 1)
            end
        end

        -- Replace when inheritance is implemented.
        function CheckTypeOneOf(object, ...)
            if type(object) ~= 'table' then
                error('Object must be of table type.', 3)
            end

            for _, typeName in ipairs { ... } do
                if object.Type == typeName then
                    return
                end
            end

            error('Object not of any of the given types.', 3)
        end

        -- Replace when inheritance is implemented.
        function CheckTypeOneOfOrNil(object, ...)
            if object ~= nil then
                if type(object) ~= 'table' then
                    error('Object must be of table type.', 3)
                end

                for _, typeName in ipairs { ... } do
                    if object.Type == typeName then
                        return
                    end
                end

                error('Object not of any of the given types.', 3)
            end
        end
    else
        function CheckSelf(...)
        end

        function CheckNotSelf(...)
        end

        function CheckType(...)
        end

        function CheckTypeOrNil(...)
        end

        function CheckTypeOneOf(...)
        end

        function CheckTypeOneOfOrNil(...)
        end
    end

    return true
end

-- Disabled by default
TypeSystemChecks(false)

--
-- Helper functions
--

function contains(value, array)
    for i = 1, #array do
        if array[i] == value then
            return true
        end
    end

    if type(value) == 'table' then
        for i = 1, #array do
            for j = 1, #value do
                if array[i] == value[j] then
                    return true
                end
            end
        end
    end

    return false
end

--
-- Debugging hooks back into host
--

Debug = {}

function Debug.Break()
    if Host_DebuggerEntry then
        Host_DebuggerEntry('break')
    end
end

function Debug.Trace(message)
    if Host_DebuggerEntry then
        Host_DebuggerEntry('trace', message)
    end
end

function Debug.StartProfiler()
    if Host_DebuggerEntry then
        Host_DebuggerEntry('start_profiler', message)
    end
end

function Debug.StopProfiler()
    if Host_DebuggerEntry then
        Host_DebuggerEntry('stop_profiler', message)
    end
end
