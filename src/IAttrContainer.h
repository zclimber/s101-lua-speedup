//
// Created by ME on 01.04.2019.
//

#ifndef PROJECT_IATTRCONTAINER_H
#define PROJECT_IATTRCONTAINER_H

#include "Spatial.h"

class IAttrContainer {
public:
    virtual bool CheckAttr(const char *attr_name, int value) const = 0;

    virtual int CheckAttrExists(const char *attr_name) const = 0;

    virtual bool GetRealAttrByID(const char *attr_name, double *value) const = 0;

    virtual const IAttrContainer *GetComplexAttr(const char *attr_name, int index) const = 0;

    virtual const int GetComplexAttrCount(const char *attr_name) const = 0;

    virtual int GetIntEnumAttr(const char *attr_name, int index) const = 0;

    virtual int GetIntEnumAttrCount(const char *attr_name) const = 0;

    virtual const char *GetStringAttr(const char *attr_name) const = 0;

    virtual bool GetBoolAttr(const char *attr_name) const = 0;

    virtual ~IAttrContainer() = default;
};

class IFeature : public IAttrContainer {
public:
    virtual int GetClass() const = 0;

    virtual void GetPermittedPrimitives(char *buf, int buflen) const = 0;

    virtual const char *GetPermittedPrimitives() const = 0;

    virtual SpatialReference GetSpatialId() const = 0;

};

#endif //PROJECT_IATTRCONTAINER_H
