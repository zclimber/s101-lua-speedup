local DrawFunctions = require('DrawFunctions')
local ClassNames = require('ClassCodes')
local DrawFunctionsById = {}

for k, v in pairs(ClassNames) do
    DrawFunctionsById[k] = DrawFunctions[v]
end

return DrawFunctionsById