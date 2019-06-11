--[[
This file contains the global functions that define the Lua portrayal API.
These functions are called by the host program.
--]]

-- Quick way to create small arrays.
function CreateArray(...)
    return { ... }
end

-- Used to hold references to portrayalContexts
portrayalContexts = {}

function InitializePortrayalContext(datasetID)
    local portrayalContext = PortrayalModel.CreatePortrayalContext(datasetID)

    portrayalContexts[datasetID] = portrayalContext
end

function GetPortrayalContextParameters(datasetID)
    if not portrayalContexts[datasetID] then
        InitializePortrayalContext(datasetID)
    end

    return portrayalContexts[datasetID].ContextParameters
end

-- Called by host to free up memory if it's determined a dataset may not be needed immediately.
function ReleasePortrayalContext(datasetID)
    portrayalContexts[datasetID] = nil
end

local nilAttribute = {}

local function LookupAttributeValue(t, k, HostGetAttribute)
    local attributeMetatable = {
        __index = function(t, k)
            return LookupAttributeValue(t, k, HostGetAttribute)
        end
    }

    local k1 = k

    local nilIfMissing = false

    -- Is this a "nil if missing" attribute?
    if k:sub(1, 1) == '!' then
        nilIfMissing = true

        k = k:sub(2)
    end

    -- Is this an enum string attribute?
    if k:sub(1, 1) == '$' then
        k = k:sub(2)
    end

    local codeIndexPairs = {}

    local t1 = t

    while rawget(t1, 'Parent') do
        table.insert(codeIndexPairs, 1, t1.Index)
        table.insert(codeIndexPairs, 1, t1.AttributeCode)

        t1 = rawget(t1, 'Parent')
    end

    local isComplex, r1, r2 = HostGetAttribute(t.ID, k, codeIndexPairs)

    if isComplex == nil then
        if not nilIfMissing then
            local errorCode = r1

            if errorCode == 1 then
                error('Attribute "' .. k .. '" not found in feature catalogue.')
            elseif errorCode == 2 then
                error('Attribute "' .. k .. '" not valid for feature "' .. t.Code .. '"')
            else
                error('Unknown error code ' .. errorCode .. ' returned from Host_..._GetAttribute')
            end
        end
    elseif isComplex then
        local count = r1
        local isArray = r2

        if isArray then
            local values = {}

            for i = 1, count do
                local value = { Type = 'ComplexAttribute', Parent = t, ID = t.ID, AttributeCode = k, Index = i }

                setmetatable(value, attributeMetatable)

                values[#values + 1] = value
            end

            t[k] = values
        else
            if count ~= 0 then
                local value = { Type = 'ComplexAttribute', Parent = t, ID = t.ID, AttributeCode = k, Index = 1 }

                setmetatable(value, attributeMetatable)

                t[k] = value
            end
        end
    else
        local value = r1
        local stringValue = r2

        t[k] = value
        t['!' .. k] = value
        t['$' .. k] = stringValue
    end

    return rawget(t, k1)
end

PrimitiveType = {
    None = { Type = 'PrimitiveType', Value = 0, Name = 'None' },
    Point = { Type = 'PrimitiveType', Value = 1, Name = 'Point' },
    MultiPoint = { Type = 'PrimitiveType', Value = 2, Name = 'MultiPoint' },
    Curve = { Type = 'PrimitiveType', Value = 3, Name = 'Curve' },
    Surface = { Type = 'PrimitiveType', Value = 4, Name = 'Surface' }
}

SpatialType = {
    Point = { Type = 'SpatialType', Value = 1, Name = 'Point' },
    MultiPoint = { Type = 'SpatialType', Value = 2, Name = 'MultiPoint' },
    Curve = { Type = 'SpatialType', Value = 3, Name = 'Curve' },
    CompositeCurve = { Type = 'SpatialType', Value = 4, Name = 'CompositeCurve' },
    Surface = { Type = 'SpatialType', Value = 5, Name = 'Surface' }
}

Orientation = {
    Forward = { Type = 'Orientation', Value = 1, Name = 'Forward' },
    Reverse = { Type = 'Orientation', Value = 2, Name = 'Reverse' }
}

Interpolation = {
    None = { Type = 'Interpolation', value = 0, Name = 'None' },
    Linear = { Type = 'Interpolation', value = 1, Name = 'Linear' },
    Geodesic = { Type = 'Interpolation', value = 2, Name = 'Geodesic' },
    Arc3Points = { Type = 'Interpolation', value = 3, Name = 'Arc3Points' },
    Loxodromic = { Type = 'Interpolation', value = 4, Name = 'Loxodromic' },
    Elliptical = { Type = 'Interpolation', value = 5, Name = 'Elliptical' },
    Conic = { Type = 'Interpolation', value = 6, Name = 'Conic' },
    CircularArcCenterPointWithRadius = { Type = 'Interpolation', value = 7, Name = 'CircularArcCenterPointWithRadius' }
}

local featureCache = {}

function CreateFeature(featureID, featureCode)
    local featureMetatable = {
        __index = function(t, k)
            if k == 'Spatial' or k == 'Point' or k == 'MultiPoint' or k == 'Curve' or k == 'CompositeCurve' or k == 'Surface' then
                local spatial = t:GetSpatial()

                --if spatial ~= nil then
                --t['SpatialType'] = spatial.SpatialType
                --end

                if k == 'Spatial' or spatial.SpatialType.Name == k then
                    return spatial
                end
            elseif k == 'PrimitiveType' then
                local pt = PrimitiveType.None
                local sa = t:GetSpatialAssociation()

                if sa ~= nil then
                    if sa.SpatialType == SpatialType.Point then
                        pt = PrimitiveType.Point
                    elseif sa.SpatialType == SpatialType.MultiPoint then
                        pt = PrimitiveType.MultiPoint
                    elseif sa.SpatialType == SpatialType.Curve or sa.SpatialType == SpatialType.CompositeCurve then
                        pt = PrimitiveType.Curve
                    elseif sa.SpatialType == SpatialType.Surface then
                        pt = PrimitiveType.Surface
                    end
                end

                t['PrimitiveType'] = pt

                return pt
            elseif k == 'SpatialAssociations' then
                return t:GetSpatialAssociations()
            else
                local av = LookupAttributeValue(t, k, Host_Feature_GetAttribute)

                if av ~= nil then
                    return av
                end
            end
        end
    }

    --local feature = { Type = 'Feature', ID = featureID, Code = featureCode }

    local feature = featureCache[featureID]

    if feature then
        return feature
    end

    feature = { Type = 'Feature', ID = featureID, Code = featureCode }

    featureCache[featureID] = feature

    function feature:GetInformationAssociations(associationCode, roleCode)
        CheckSelf(self, 'Feature')

        -- TODO: Store results
        return Host_Feature_GetInformationAssociations(self.ID, associationCode, roleCode)
    end

    function feature:GetInformationAssociation(associationCode, roleCode)
        CheckSelf(self, 'Feature')

        local ia = self:GetInformationAssociations(associationCode, roleCode)

        if ia and #ia == 1 then
            return ia[1]
        end
    end

    function feature:GetFeatureAssociations(associationCode, roleCode)
        CheckSelf(self, 'Feature')

        -- TODO: Store results
        return Host_Feature_GetFeatureAssociations(self.ID, associationCode, roleCode)
    end

    function feature:GetSpatialAssociations()
        CheckSelf(self, 'Feature')

        local sas = rawget(self, 'SpatialAssociations')

        sas = sas or Host_Feature_GetSpatialAssociations(self.ID)

        self['SpatialAssociations'] = sas

        CheckTypeOrNil(sas, 'array:SpatialAssociation')

        return sas
    end

    function feature:GetSpatialAssociation()
        CheckSelf(self, 'Feature')

        -- TODO: Pick single association based on current scale.
        local sas = self:GetSpatialAssociations()

        if sas ~= nil then
            return sas[1]
        end
    end

    function feature:GetSpatial()
        CheckSelf(self, 'Feature')

        local sa = self:GetSpatialAssociation()

        if sa ~= nil then
            self['Spatial'] = sa.Spatial

            self[sa.SpatialType.Name] = self['Spatial']

            return self['Spatial']
        end
    end

    -- Returns an iterator that returns all spatial associations to points, multi points and curves
    -- associated to the feature.  Surface and composite curves return only their ultimate simple curves.
    -- This only works for features with a single spatial association.
    function feature:GetFlattenedSpatialAssociations()
        local spatialType = self:GetSpatial().SpatialType

        if contains(spatialType, { SpatialType.Point, SpatialType.MultiPoint, SpatialType.Curve }) then
            local first = true

            return function()
                if first then
                    first = false
                    return self:GetSpatialAssociation()
                end
            end
        elseif spatialType == SpatialType.CompositeCurve then
            local i = 0

            return function()
                i = i + 1
                return self.CompositeCurve.CurveAssociations[i]
            end
        elseif spatialType == SpatialType.Surface then
            -- Do this the hard way since coroutines don't play nice with C callbacks.
            local iRing = 0
            local iCurve = 0

            return function()
                local ring

                if iRing == 0 then
                    ring = self.Surface.ExteriorRing
                else
                    ring = self.Surface.InteriorRings[iRing]
                end

                while ring do
                    if iCurve == 0 then
                        if ring.SpatialType == SpatialType.Curve then
                            iRing = iRing + 1
                            return ring
                        end
                    end

                    iCurve = iCurve + 1

                    local ca = ring.Spatial.CurveAssociations[iCurve]

                    if ca then
                        return ca
                    end

                    iCurve = 0

                    iRing = iRing + 1

                    ring = self.Surface.InteriorRings[iRing]
                end
            end
        end
    end

    function feature:IsVisible()
        return Host_Feature_IsVisible(self.ID)
    end

    setmetatable(feature, featureMetatable)

    return feature
end

function CreateInformation(informationID)
    local informationMetatable = {
        __index = function(t, k)
            local av = LookupAttributeValue(t, k, Host_Information_GetAttribute)

            if av ~= nil then
                return av
            end
        end
    }

    local information = { Type = 'Information', ID = informationID }

    function information:GetInformationAssociations(associationCode, roleCode)
        error('information:GetInformationAssociations not implemented.')
    end

    setmetatable(information, informationMetatable)

    return information
end

function CreateSpatialAssociation(spatialType, spatialID, orientation, scaleMinimum, scaleMaximum)
    local spatialAssociationMetatable = {
        __index = function(t, k)
            if k == 'Spatial' then
                -- TODO: Cache shared spatials
                local spatial = Host_GetSpatial(t.SpatialID)

                if spatial ~= nil then
                    CheckType(spatial, 'Spatial')
                    spatial['SpatialID'] = t.SpatialID

                    t['Spatial'] = spatial
                end

                return spatial
            elseif k == 'AssociatedFeatures' then
                return t:GetAssociatedFeatures()
            end
        end
    }

    if type(spatialType) == 'string' then
        spatialType = SpatialType[spatialType]
    end

    if type(orientation) == 'string' then
        orientation = Orientation[orientation]
    end

    CheckType(spatialType, 'SpatialType')
    CheckTypeOrNil(orientation, 'Orientation')
    CheckTypeOrNil(scaleMinimum, 'number')
    CheckTypeOrNil(scaleMaximum, 'number')

    local spatialAssociation = { Type = 'SpatialAssociation', SpatialType = spatialType, SpatialID = spatialID, Orientation = orientation, ScaleMinimum = scaleMinimum, ScaleMaximum = scaleMaximum }

    function spatialAssociation:GetAssociatedFeatures()
        self.AssociatedFeatures = Host_Spatial_GetAssociatedFeatures(self.SpatialID)

        CheckType(self.AssociatedFeatures, 'array:Feature')

        return self.AssociatedFeatures
    end

    setmetatable(spatialAssociation, spatialAssociationMetatable)

    return spatialAssociation
end

local function CreateSpatial(spatialType, spatial)
    CheckType(spatialType, 'SpatialType')

    local spatial = { Type = 'Spatial', SpatialType = spatialType, Spatial = spatial }

    function spatial:GetInformationAssociations(associationCode, roleCode)
        CheckSelf(self, 'Spatial')

        -- TODO: Store results
        return Host_Spatial_GetInformationAssociations(self.SpatialID, associationCode, roleCode)
    end

    function spatial:GetInformationAssociation(associationCode, roleCode)
        CheckSelf(self, 'Spatial')

        local ia = self:GetInformationAssociations(associationCode, roleCode)

        if ia and #ia == 1 then
            return ia[1]
        end
    end

    return spatial
end

function CreatePoint(x, y, z)
    CheckType(x, 'number')
    CheckType(y, 'number')
    CheckTypeOrNil(z, 'number')

    local point = CreateSpatial(SpatialType.Point, { X = x, Y = y, Z = z })

    point.X = point.Spatial.X
    point.Y = point.Spatial.Y
    point.Z = point.Spatial.Z

    return point
end

function CreateMultiPoint(points)
    CheckType(points, 'array:Spatial')

    local multiPoint = CreateSpatial(SpatialType.MultiPoint, points)

    multiPoint.Points = multiPoint.Spatial

    return multiPoint
end

function CreateCurveSegment(controlPoints, interpolation)
    interpolation = interpolation or Interpolation.Loxodromic

    if type(interpolation) == 'string' then
        interpolation = Interpolation[interpolation]
    end

    CheckType(controlPoints, 'array:Spatial')
    CheckType(interpolation, 'Interpolation')

    return { Type = 'CurveSegment', ControlPoints = controlPoints, Interpolation = interpolation }
end

function CreateCurve(startPoint, endPoint, segments)
    CheckType(startPoint, 'Spatial')
    CheckType(endPoint, 'Spatial')
    CheckTypeOrNil(segments, 'array:CurveSegment')

    local curve = CreateSpatial(SpatialType.Curve, { StartPoint = startPoint, EndPoint = endPoint, Segments = segments })

    curve.StartPoint = curve.Spatial.StartPoint
    curve.EndPoint = curve.Spatial.EndPoint
    curve.Segments = curve.Spatial.Segments

    return curve
end

function CreateCompositeCurve(curveAssociations)
    CheckType(curveAssociations, 'array:SpatialAssociation')

    local compositeCurve = CreateSpatial(SpatialType.CompositeCurve, curveAssociations)

    compositeCurve.CurveAssociations = compositeCurve.Spatial

    return compositeCurve
end

function CreateMultiPoint(points)
    CheckType(points, 'array:Spatial')

    local multiPoint = CreateSpatial(SpatialType.MultiPoint, points)

    multiPoint.Points = multiPoint.Spatial

    return multiPoint
end

function CreateSurface(exteriorRing, interiorRings)
    CheckType(exteriorRing, 'SpatialAssociation')
    CheckType(interiorRings, 'array:SpatialAssociation')

    local surface = CreateSpatial(SpatialType.Surface, { ExteriorRing = exteriorRing, InteriorRings = interiorRings })

    surface.ExteriorRing = surface.Spatial.ExteriorRing
    surface.InteriorRings = surface.Spatial.InteriorRings

    return surface
end
