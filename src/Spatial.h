//
// Created by ME on 23.05.2019.
//

#ifndef PROJECT_SPATIAL_H
#define PROJECT_SPATIAL_H

#include <vector>
#include <cassert>

extern "C" {
enum SpatialReferenceType {
    Point = 110, Curve = 120, CompositeCurve = 125, Surface = 130, Unknown = -100
};

struct SpatialReference {
    int SpatialID;
    int Orientation;
    int SpatialType;

    SpatialReference();

    SpatialReference(int id, int direction, int type);

    const char *SpatialTypeName() const;

    const char *PrimitiveName() const;

    int PrimitiveNumber() const;
};
struct GeoPoint {
    double lat, lon;
};
}

class Spatial {
private:
public:
    int id;
    SpatialReferenceType type;
    const char *type_name = "None";
    int scale_minimum, scale_maximum;
    GeoPoint isolated_point = {0, 0};
    std::vector<GeoPoint> geo_points;
    std::vector<SpatialReference> references;
public:
    Spatial(int id, int type);

    Spatial(int id, int type_int, int scaleMinimum, int scaleMaximum);

    void setGeoPoint(double lat, double lon);

    void addGeoPoint(double lat, double lon);

    void addReference(int ref_id, int orientation, int ref_type);
};


#endif //PROJECT_SPATIAL_H
