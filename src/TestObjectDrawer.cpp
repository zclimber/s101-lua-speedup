//
// Created by ME on 01.04.2019.
//

#include <iostream>
#include <fstream>
#include "TestObjectDrawer.h"

#include "S100RulesParser/private/S101Primitives.h"

void printSymbolParam(SymbolParam &param, std::ostream &out) {
    out << S101Symbols::SymbolsById()[param.symbol_name].NameSymbol << "\n";
}

#define print_clr(x) " clr " << x.r << " " << x.g << " " << x.b

void printTextParam(TextParam &param, std::ostream &out) {
    out << param.text << " " << param.font << print_clr(param) << " " << param.transparency << " sz "
        << param.size << " w " << param.weight << " sl " << param.slant << " xy " << param.x << " " << param.y << "\n";
}

void printSimpleLineParam(SimpleLineParam &param, std::ostream &out) {
    out << param.width << print_clr(param) << " isl " << param.interval << " " << param.start << " " << param.length
        << "\n";
}

void printColourFillAreaParam(ColourFillAreaParam &param, std::ostream &out) {
    out << print_clr(param) << " " << param.transparency << "\n";
}

void printSymbolFillAreaParam(SymbolFillAreaParam &param, std::ostream &out) {
    out << param.symbol << " xyxy " << param.x1 << " " << param.y1 << " " << param.x2 << " " << param.y2 << "\n";
}

void printComplexlLineParam(ComplexlLineParam &param, std::ostream &out) {
    out << param.width << print_clr(param) << " isl " << param.interval << " " << param.offset << "\n";
    out << "dashes " << param.num_dashes_x2 / 2 << ":";
    for (int i = 0; i < param.num_dashes_x2; ++i) {
        out << " " << param.dashes[i];
    }
    out << "syms " << param.num_symb << ":";
    for (int i = 0; i < param.num_symb; ++i) {
        out << " " << param.symbols[i] << " " << param.symbols_position[i] << " " << param.symbol_offset[i] << ";";
    }
}

void TestObjectDrawer::AddFunction(int drawing_priority, int viewing_group, S101ObjectDrawerParam &param, int operation,
                                   int index_feature) {
    drawCalls++;
    return; // TODO
    if (!prefix.empty()) {
        char buf[10];
        sprintf(buf, "%4d", index_feature);
        std::ofstream out(prefix + buf + ".txt", std::ios::app);
        int clazz = GetFeature(index_feature).GetClass();
        const ComplexAttrDescriptor &clazzDesc = GetCatalogue().feats_by_id.find(clazz)->second;
        out << index_feature << " " << clazzDesc.name;// << " " << viewing_group << " " << drawing_priority;
        switch (operation) {
            case idColourFillArea:
                out << " cfa\n";
                printColourFillAreaParam(param.m_ColourFillAreaParam, out);
                break;
            case idDrawComplexlLine:
                out << " cline\n";
                printComplexlLineParam(param.m_ComplexlLineParam, out);
                break;
            case idDrawSimpleLine:
                out << " sline\n";
                printSimpleLineParam(param.m_SimpleLineParam, out);
                break;
            case idDrawSymbol:
                out << " sym\n";
                printSymbolParam(param.m_SymbolParam, out);
                break;
            case idSymbolFillArea:
                out << " sfa\n";
                printSymbolFillAreaParam(param.m_SymbolFillAreaParam, out);
                break;
            case idDrawText:
                out << " txt\n";
                printTextParam(param.m_TextParam, out);
                break;
            default:
                out << "Unknown operation " << operation << "\n";
        }
        out << std::endl;
        out.flush();
    }
}

int TestObjectDrawer::GetFeatureCount() const {
    return features.size();
}

const IContext &TestObjectDrawer::GetContext() const {
    return context;
}

const IFeature &TestObjectDrawer::GetFeature(int index_feature) const {
    auto ptr = features.find(index_feature % (1U << 20U));
    if (ptr != features.end()) {
        return ptr->second;
    } else {
        return dummyFeature;
    }
}

const Spatial &TestObjectDrawer::GetSpatial(int id_spatial) const {
    auto ptr = spatials.find(id_spatial);
    if (ptr != spatials.end()) {
        return ptr->second;
    } else {
        return dummySpatial;
    }
}

Context &TestObjectDrawer::GetMutableContext() {
    return context;
}

void TestObjectDrawer::AddFeature(Feature &&feature, int index_feature) {
    features.insert({index_feature, std::move(feature)});
//    features[index_feature] = feature;
}

void TestObjectDrawer::AddSpatial(Spatial &&spatial) {
    spatials.insert({spatial.id, std::move(spatial)});
}

void TestObjectDrawer::RunOnAllFeatures(const std::function<void(IObjectDrawer *, int, int)> &function,
                                        const std::string &prefix) {
    drawCalls = 0;
    this->prefix = prefix;
    for (auto &x : features) {
        function(this, x.second.GetClass(), x.first);
    }
}

void TestObjectDrawer::RunOnSetFeatures(const std::function<void(IObjectDrawer *, int, int)> &function,
                                        const std::string &prefix, const std::vector<int> &givenFeatures) {
    drawCalls = 0;
    this->prefix = prefix;
    for (auto &x : givenFeatures) {
        function(this, GetFeature(x).GetClass(), x);
    }
}

const Catalogue &TestObjectDrawer::GetCatalogue() const {
    return catalogue;
}

void TestObjectDrawer::SetCatalogue(Catalogue &&cat) {
    catalogue = std::move(cat);
}

bool Context::IsSymbolizedAreas() const {
    return bools[SymAreas];
}

bool Context::IsSimplifiedPoints() const {
    return bools[SimPoints];
}

bool Context::GetFourShades() const {
    return bools[FourShades];
}

double Context::GetShallowContour() const {
    return doubles[ShContour];
}

bool Context::GetShallowPattern() const {
    return bools[ShallowPattern];
}

double Context::GetSafetyContour() const {
    return doubles[SafContour];
}

double Context::GetDeepContour() const {
    return doubles[DeepContour];
}

double Context::GetSafetyDepth() const {
    return doubles[SafDepth];
}

bool Context::CheckViewingGroup(int group) const {
    return viewingGroups.count(group) > 0;
}

void Context::SetBooleans(int mask) {
    SetIsSimplifiedPoints((mask & (1 << SimPoints)) != 0);
    SetIsSymbolizedAreas((mask & (1 << SymAreas)) != 0);
    SetFourShades((mask & (1 << FourShades)) != 0);
    SetShallowPattern((mask & (1 << ShallowPattern)) != 0);
}

void Context::SetIsSymbolizedAreas(bool value) {
    bools[SymAreas] = value;
}

void Context::SetIsSimplifiedPoints(bool value) {
    bools[SimPoints] = value;
}

void Context::SetFourShades(bool value) {
    bools[FourShades] = value;

}

void Context::SetShallowPattern(bool value) {
    bools[ShallowPattern] = value;

}

void Context::SetShallowContour(double value) {
    doubles[ShContour] = value;
}

void Context::SetSafetyContour(double value) {
    doubles[SafContour] = value;
}

void Context::SetDeepContour(double value) {
    doubles[DeepContour] = value;
}

void Context::SetSafetyDepth(double value) {
    doubles[SafDepth] = value;
}

void Context::SetDoubles(double shallowContour, double safetyContour, double deepContour, double safetyDepth) {
    SetShallowContour(shallowContour);
    SetSafetyContour(safetyContour);
    SetDeepContour(deepContour);
    SetSafetyDepth(safetyDepth);
}

bool Feature::CheckAttr(const char *attr_name, int value) const {
    return core.CheckAttr(attr_name, value);
}

int Feature::CheckAttrExists(const char *attr_name) const {
    return core.CheckAttrExists(attr_name);
}

bool Feature::GetRealAttrByID(const char *attr_name, double *value) const {
    return core.GetRealAttrByID(attr_name, value);
}

void Feature::GetPermittedPrimitives(char *buf, int buflen) const {
    int len = std::min(buflen, int(primitive.size() + 1));
    std::copy(primitive.data(), primitive.data() + len, buf);
}

Feature::Feature(
        const SpatialReference &spatial,
        int clazz,
        const ComplexAttr &core) : spatial(spatial), clazz(clazz),
                                   core(core), primitive(spatial.SpatialTypeName()) {
    if (spatial.SpatialType == CompositeCurve) {
        primitive = "Curve";
    }
}

int Feature::GetClass() const {
    return clazz;
}

const IAttrContainer *Feature::GetComplexAttr(const char *attr_name, int index) const {
    return core.GetComplexAttr(attr_name, index);
}

const int Feature::GetComplexAttrCount(const char *attr_name) const {
    return core.GetComplexAttrCount(attr_name);
}

int Feature::GetIntEnumAttr(const char *attr_name, int index) const {
    return core.GetIntEnumAttr(attr_name, index);
}

int Feature::GetIntEnumAttrCount(const char *attr_name) const {
    return core.GetIntEnumAttrCount(attr_name);
}

const char *Feature::GetStringAttr(const char *attr_name) const {
    return core.GetStringAttr(attr_name);
}

bool Feature::GetBoolAttr(const char *attr_name) const {
    return core.GetBoolAttr(attr_name);
}

const char *Feature::GetPermittedPrimitives() const {
    return primitive.c_str();
}

SpatialReference Feature::GetSpatialId() const {
    return spatial;
}

bool ComplexAttr::CheckAttr(const char *attr_name, int value) const {
    auto range = int_attrs.equal_range(attr_name);
    for (auto pt = range.first; pt != range.second; ++pt) {
        if (pt->second == value)
            return true;
    }
    return false;
}

int ComplexAttr::CheckAttrExists(const char *attr_name) const {
    auto iter = attr_count.find(attr_name);
    if (iter != attr_count.end()) {
        return iter->second;
    } else {
        return 0;
    }
}

bool ComplexAttr::GetRealAttrByID(const char *attr_name, double *value) const {
    auto range = real_attrs.equal_range(attr_name);
    for (auto pt = range.first; pt != range.second; ++pt) {
        *value = pt->second;
        return true;
    }
    return false;
}

const IAttrContainer *ComplexAttr::GetComplexAttr(const char *attr_name, int index) const {
    auto range = compl_attrs.equal_range(attr_name);
    for (auto pt = range.first; pt != range.second; ++pt) {
        index--;
        if (!index) {
            return &(pt->second);
        }
    }
    return nullptr;
}

const int ComplexAttr::GetComplexAttrCount(const char *attr_name) const {
    return compl_attrs.count(attr_name);
}

int ComplexAttr::GetIntEnumAttr(const char *attr_name, int index) const {
    auto range = int_attrs.equal_range(attr_name);
    for (auto pt = range.first; pt != range.second; ++pt) {
        index--;
        if (!index) {
            return pt->second;
        }
    }
    return -1;
}

int ComplexAttr::GetIntEnumAttrCount(const char *attr_name) const {
    return int_attrs.count(attr_name);
}

const char *ComplexAttr::GetStringAttr(const char *attr_name) const {
    auto range = string_attrs.equal_range(attr_name);
    for (auto pt = range.first; pt != range.second; ++pt) {
        return pt->second.c_str();
    }
    return nullptr;
}

bool ComplexAttr::GetBoolAttr(const char *attr_name) const {
    auto range = bool_attrs.equal_range(attr_name);
    for (auto pt = range.first; pt != range.second; ++pt) {
        return pt->second;
    }
    return false;
}

void ComplexAttr::RecalcAttrCount() {
    attr_count.clear();
    for (const auto &x : string_attrs) {
        attr_count[x.first]++;
    }
    for (const auto &x : bool_attrs) {
        attr_count[x.first]++;
    }
    for (const auto &x : int_attrs) {
        attr_count[x.first]++;
    }
    for (const auto &x : real_attrs) {
        attr_count[x.first]++;
    }
    for (const auto &x : compl_attrs) {
        attr_count[x.first]++;
    }
}

int timer::stop() {
    auto end = std::chrono::high_resolution_clock::now();
    stopped = true;
    return std::chrono::duration_cast<std::chrono::microseconds>(end - start).count();
}

timer::~timer() {
    if (!stopped) {
        auto end = std::chrono::high_resolution_clock::now();
        std::cout << reason << " took "
                  << std::chrono::duration_cast<std::chrono::microseconds>(end - start).count()
                  << "us.\n";
    }
}

