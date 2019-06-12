-- Main entry point for feature type.
local Portrayals = Portrayals
local Graphics = Graphics
local PortrayalModel = PortrayalModel
local Symbol = Symbol
local AreaFills = AreaFills
local LineStyles = LineStyles
local Text = Text
local PrimitiveType = PrimitiveType
function Portrayals.RangeSystem(feature, featurePortrayal, contextParameters)
    -- No portrayal needed.  Portrayal of components is sufficient.
    featurePortrayal:AddNullInstruction()
end
