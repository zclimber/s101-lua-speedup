//
// Created by ME on 01.04.2019.
//

#ifndef PROJECT_TESTOBJECTDRAWER_H
#define PROJECT_TESTOBJECTDRAWER_H


#include "IObjectDrawer.h"
#include "Spatial.h"

#include <string>
#include <map>
#include <set>
#include <vector>
#include <functional>
#include <chrono>

class ComplexAttr : public IAttrContainer {
    std::map<std::string, int> attr_count;
public:
    ComplexAttr() = default;

    std::multimap<std::string, std::string> string_attrs;
    std::multimap<std::string, bool> bool_attrs;
    std::multimap<std::string, int> int_attrs;
    std::multimap<std::string, double> real_attrs;
    std::multimap<std::string, ComplexAttr> compl_attrs;

    void RecalcAttrCount();

    int GetIntEnumAttr(const char *attr_name, int index) const override;

    int GetIntEnumAttrCount(const char *attr_name) const override;

    const char *GetStringAttr(const char *attr_name) const override;

    bool GetBoolAttr(const char *attr_name) const override;

    bool CheckAttr(const char *attr_name, int value) const override;

    int CheckAttrExists(const char *attr_name) const override;

    bool GetRealAttrByID(const char *attr_name, double *value) const override;

    const IAttrContainer *GetComplexAttr(const char *attr_name, int index) const override;

    const int GetComplexAttrCount(const char *attr_name) const override;

    ~ComplexAttr() override = default;
};

class Feature : public IFeature {
public:
    const char *GetPermittedPrimitives() const override;

    int GetIntEnumAttr(const char *attr_name, int index) const override;

    int GetIntEnumAttrCount(const char *attr_name) const override;

    const char *GetStringAttr(const char *attr_name) const override;

    bool GetBoolAttr(const char *attr_name) const override;

private:
    std::string primitive;
    int clazz;
    SpatialReference spatial;
    ComplexAttr core;
public:
    SpatialReference GetSpatialId() const override;

    const IAttrContainer *GetComplexAttr(const char *attr_name, int index) const override;

    const int GetComplexAttrCount(const char *attr_name) const override;

    Feature(const SpatialReference &spatial, int clazz, const ComplexAttr &core);

    bool CheckAttr(const char *attr_name, int value) const override;

    int CheckAttrExists(const char *attr_name) const override;

    bool GetRealAttrByID(const char *attr_name, double *value) const override;

    ~Feature() override = default;

    void GetPermittedPrimitives(char *buf, int buflen) const override;

    int GetClass() const override;
};

class Context : public IContext {
    bool bools[4] = {false, true, false, false};
    double doubles[4] = {2.0, 30.0, 30.0, 30.0};
    enum {
        SymAreas, SimPoints, FourShades, ShallowPattern
    };
    enum {
        ShContour, SafContour, DeepContour, SafDepth
    };
public:
    std::set<int> viewingGroups;

    bool IsSymbolizedAreas() const override;

    bool IsSimplifiedPoints() const override;

    bool GetFourShades() const override;

    double GetShallowContour() const override;

    bool GetShallowPattern() const override;

    double GetSafetyContour() const override;

    double GetDeepContour() const override;

    double GetSafetyDepth() const override;

    bool CheckViewingGroup(int group) const override;

    ~Context() override = default;

    void SetBooleans(int mask);

    void SetIsSymbolizedAreas(bool value);

    void SetIsSimplifiedPoints(bool value);

    void SetFourShades(bool value);

    void SetShallowPattern(bool value);

    void SetShallowContour(double value);

    void SetSafetyContour(double value);

    void SetDeepContour(double value);

    void SetSafetyDepth(double value);

    void SetDoubles(double shallowContour, double safetyContour, double deepContour, double safetyDepth);
};

class TestObjectDrawer : public IObjectDrawer {
private:
    Spatial dummySpatial = Spatial(-1, SpatialReferenceType::Unknown);
    Feature dummyFeature = Feature(SpatialReference(-1, 1, SpatialReferenceType::Unknown), -1, ComplexAttr());
    Context context;
    std::map<int, Feature> features;
    std::string prefix;
    Catalogue catalogue;
    std::map<int, Spatial> spatials;
public:
    int drawCalls;

    const Catalogue &GetCatalogue() const override;

    TestObjectDrawer() = default;

    const IContext &GetContext() const override;

    const IFeature &GetFeature(int index_feature) const override;

    void AddFunction(int drawing_priority, int viewing_group, S101ObjectDrawerParam &param, int operation,
                     int index_feature) override;

    Context &GetMutableContext();

    void SetCatalogue(Catalogue &&cat);

    virtual void
    RunOnAllFeatures(const std::function<void(IObjectDrawer *, int, int)> &function, const std::string &prefix);

    virtual void
    RunOnSetFeatures(const std::function<void(IObjectDrawer *, int, int)> &function, const std::string &prefix,
                     const std::vector<int> &features);

    void AddFeature(Feature &&feature, int index_feature);

    void AddSpatial(Spatial &&spatial);

    const Spatial &GetSpatial(int id_spatial) const override;

    ~TestObjectDrawer() override = default;

    int GetFeatureCount() const override;
};

class timer {
    std::chrono::high_resolution_clock::time_point start = std::chrono::high_resolution_clock::now();
    const char *reason = "Action";
    bool stopped = false;
public:

    timer() = default;

    explicit timer(const char *reason) : reason(reason) {
    }

    int stop();

    ~timer();
};


#endif //PROJECT_TESTOBJECTDRAWER_H
