//
// Created by ME on 23.05.2019.
//

#include "Spatial.h"

SpatialReference::SpatialReference() {}

SpatialReference::SpatialReference(int id, int direction, int type) : SpatialID(id), Orientation(direction),
                                                                      SpatialType(type) {}

const char *SpatialReference::SpatialTypeName() const {
    switch (SpatialType) {
        case SpatialReferenceType::Point:
            return "Point";
        case SpatialReferenceType::Curve:
            return "Curve";
        case SpatialReferenceType::CompositeCurve:
            return "CompositeCurve";
        case SpatialReferenceType::Surface:
            return "Surface";
        default:
            return "Unknown";
    }
}

Spatial::Spatial(int id, int type) : Spatial(id, type, 0, -1) {}

Spatial::Spatial(int id, int type_int, int scaleMinimum, int scaleMaximum) : id(id), scale_minimum(scaleMinimum),
                                                                             scale_maximum(scaleMaximum) {
    switch (type_int) {
        case SpatialReferenceType::Point:
            type = SpatialReferenceType::Point;
            type_name = "Point";
            break;
        case SpatialReferenceType::Curve:
            type = SpatialReferenceType::Curve;
            type_name = "Curve";
            break;
        case SpatialReferenceType::CompositeCurve:
            type = SpatialReferenceType::CompositeCurve;
            type_name = "CompositeCurve";
            break;
        case SpatialReferenceType::Surface:
            type = SpatialReferenceType::Surface;
            type_name = "Surface";
            break;
        default:
            type = SpatialReferenceType::Unknown;
            type_name = "Unknown";
    }
}

void Spatial::setGeoPoint(double lat, double lon) {
    assert(type == Point);
    isolated_point = {lat, lon};
}

void Spatial::addGeoPoint(double lat, double lon) {
    assert(type == Curve);
    geo_points.push_back({lat, lon});
}

void Spatial::addReference(int ref_id, int orientation, int ref_type) {
    assert(type == CompositeCurve || type == Surface);
    references.emplace_back(ref_id, orientation, ref_type);
}