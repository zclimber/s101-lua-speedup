//
// Created by ME on 08.04.2019.
//

#ifndef PROJECT_ICATALOGUE_H
#define PROJECT_ICATALOGUE_H

#include <set>
#include <map>


struct SimpleAttrDescriptor {
    enum Type {
        Text, Real, Int, Enum, Bool, Date, Time
    };
    std::string name;
    std::string type; // TODO add values for enums
    Type type_id;

    SimpleAttrDescriptor() = default;

    SimpleAttrDescriptor(const std::string &name, const std::string &type);
};

struct ComplexAttrDescriptor {
    struct multiplicity {
        int lower, upper;
    };
    std::string name;
    std::map<std::string, std::pair<SimpleAttrDescriptor *, multiplicity>> sub_attrs_simple;
    std::map<std::string, multiplicity> sub_attrs_complex;
    std::map<std::string, std::set<std::string>> permitted_values;

    ComplexAttrDescriptor() = default;

    explicit ComplexAttrDescriptor(const std::string &name);
};

struct Catalogue {
    std::map<int, SimpleAttrDescriptor> attributes_simple_by_id;
    std::map<int, ComplexAttrDescriptor> feats_by_id, attributes_complex_by_id;
    std::map<std::string, SimpleAttrDescriptor *> attributes_simple;
    std::map<std::string, ComplexAttrDescriptor *> feats, attributes_complex;
};

#endif //PROJECT_ICATALOGUE_H
