//
// Created by ME on 22.03.2019.
//

#include "tinyxml/tinyxml2.h"
#include "TestObjectDrawer.h"
#include "XmlLoader.h"
#include "GeneratedLists.h"
#include <iostream>
#include <fstream>
#include <cassert>
#include <sstream>
#include <iterator>
#include <algorithm>
#include <vector>

using namespace tinyxml2;
using std::string;
using std::map;
using std::set;

#define iter_xml(parent, string, x) for(XMLElement * x = (parent)->FirstChildElement(string); x != nullptr; x = x->NextSiblingElement(string))

void print_attr_types(const map<int, SimpleAttrDescriptor> &attrs) {
    map<string, int> t;
    for (auto &x : attrs) {
        if (t[x.second.type] == 0) {
            t[x.second.type] = 1;
            std::cerr << "Simple attr type " << x.second.type << "\n";
        }
    }
}

typedef XMLElement *pXElem;

map<int, string> get_raw_clazz() noexcept {
    map<int, string> name;
    name[0] = "DataCoverage";
    name[1] = "NavigationalSystemOfMarks";
    name[2] = "LocalDirectionOfBuoyage";
    name[3] = "SoundingDatum";
    name[4] = "VerticalDatumOfData";
    name[5] = "QualityOfBathymetricData";
    name[6] = "QualityOfSurvey";
    name[7] = "UpdateInformation";
    name[8] = "MagneticVariation";
    name[9] = "LocalMagneticAnomaly";
    name[10] = "Coastline";
    name[11] = "LandArea";
    name[12] = "IslandGroup";
    name[13] = "LandElevation";
    name[14] = "River";
    name[15] = "Rapids";
    name[16] = "Waterfall";
    name[17] = "Lake";
    name[18] = "LandRegion";
    name[19] = "Vegetation";
    name[20] = "IceArea";
    name[21] = "SlopingGround";
    name[22] = "SlopeTopline";
    name[23] = "Tideway";
    name[24] = "BuiltUpArea";
    name[25] = "Building";
    name[26] = "AirportAirfield";
    name[27] = "Runway";
    name[28] = "Bridge";
    name[29] = "SpanFixed";
    name[30] = "SpanOpening";
    name[31] = "Conveyor";
    name[32] = "CableOverhead";
    name[33] = "PipelineOverhead";
    name[34] = "PylonBridgeSupport";
    name[35] = "FenceWall";
    name[36] = "Railway";
    name[37] = "Road";
    name[38] = "Tunnel";
    name[39] = "Landmark";
    name[40] = "SiloTank";
    name[41] = "FortifiedStructure";
    name[42] = "ProductionStorageArea";
    name[43] = "Checkpoint";
    name[44] = "Hulk";
    name[45] = "Pile";
    name[46] = "Dyke";
    name[47] = "ShorelineConstruction";
    name[48] = "Causeway";
    name[49] = "Canal";
    name[50] = "DistanceMark";
    name[51] = "Gate";
    name[52] = "Dam";
    name[53] = "Crane";
    name[54] = "Berth";
    name[55] = "MooringWarpingFacility";
    name[56] = "DryDock";
    name[57] = "FloatingDock";
    name[58] = "Pontoon";
    name[59] = "DockArea";
    name[60] = "Gridiron";
    name[61] = "LockBasin";
    name[62] = "SeaAreaNamedWaterArea";
    name[63] = "TidalStreamFloodEbb";
    name[64] = "CurrentNonGravitational";
    name[65] = "WaterTurbulence";
    name[66] = "TidalStreamPanelData";
    name[67] = "Sounding";
    name[68] = "DredgedArea";
    name[69] = "SweptArea";
    name[70] = "DepthContour";
    name[71] = "DepthArea";
    name[72] = "DepthNoBottomFound";
    name[73] = "UnsurveyedArea";
    name[74] = "SeabedArea";
    name[75] = "WeedKelp";
    name[76] = "Sandwave";
    name[77] = "Spring";
    name[78] = "UnderwaterAwashRock";
    name[79] = "Wreck";
    name[80] = "Obstruction";
    name[81] = "FoulGround";
    name[82] = "DiscolouredWater";
    name[83] = "FishingFacility";
    name[84] = "MarineFarmCulture";
    name[85] = "OffshorePlatform";
    name[86] = "OffshoreWindTurbine";
    name[87] = "CableSubmarine";
    name[88] = "CableArea";
    name[89] = "PipelineSubmarineOnLand";
    name[90] = "SubmarinePipelineArea";
    name[91] = "OffshoreProductionArea";
    name[92] = "NavigationLine";
    name[93] = "RecommendedTrack";
    name[94] = "RangeSystem";
    name[95] = "Fairway";
    name[96] = "RecommendedRouteCentreline";
    name[97] = "TwoWayRoutePart";
    name[98] = "TwoWayRoute";
    name[99] = "RecommendedTrafficLanePart";
    name[100] = "DeepWaterRouteCenterline";
    name[101] = "DeepWaterRoutePart";
    name[102] = "DeepWaterRoute";
    name[103] = "InshoreTrafficZone";
    name[104] = "PrecautionaryArea";
    name[105] = "TrafficSeparationSchemeLanePart";
    name[106] = "TrafficSeparationZone";
    name[107] = "TrafficSeparationSchemeBoundary";
    name[108] = "TrafficSeparationLine";
    name[109] = "TrafficSeparationSchemeCrossing";
    name[110] = "TrafficSeparationSchemeRoundabout";
    name[111] = "TrafficSeparationScheme";
    name[112] = "ArchipelagicSeaLaneArea";
    name[113] = "ArchipelagicSeaLaneAxis";
    name[114] = "ArchipelagicSeaLane";
    name[115] = "RadioCallingInPoint";
    name[116] = "FerryRoute";
    name[117] = "RadarLine";
    name[118] = "RadarRange";
    name[119] = "RadarStation";
    name[120] = "AnchorageArea";
    name[121] = "AnchorBerth";
    name[122] = "SeaplaneLandingArea";
    name[123] = "MilitaryPracticeArea";
    name[124] = "AdministrationArea";
    name[125] = "CargoTranshipmentArea";
    name[126] = "CautionArea";
    name[127] = "InformationArea";
    name[128] = "ContiguousZone";
    name[129] = "ContinentalShelfArea";
    name[130] = "CustomZone";
    name[131] = "ExclusiveEconomicZone";
    name[132] = "FisheryZone";
    name[133] = "FishingGround";
    name[134] = "FreePortArea";
    name[135] = "HarbourAreaAdministrative";
    name[136] = "IncinerationArea";
    name[137] = "LogPond";
    name[138] = "OilBarrier";
    name[139] = "StraightTerritorialSeaBaseline";
    name[140] = "TerritorialSeaArea";
    name[141] = "SubmarineTransitLane";
    name[142] = "RestrictedArea";
    name[143] = "PilotageDistrict";
    name[144] = "CollisionRegulationLimit";
    name[145] = "LightAllAround";
    name[146] = "LightSectored";
    name[147] = "LightFogDetector";
    name[148] = "LightAirObstruction";
    name[149] = "BuoyLateral";
    name[150] = "BuoyCardinal";
    name[151] = "BuoyIsolatedDanger";
    name[152] = "BuoySafeWater";
    name[153] = "BuoySpecialPurposeGeneral";
    name[154] = "BuoyEmergencyWreckMarking";
    name[155] = "BuoyInstallation";
    name[156] = "BeaconLateral";
    name[157] = "BeaconCardinal";
    name[158] = "BeaconIsolatedDanger";
    name[159] = "BeaconSafeWater";
    name[160] = "BeaconSpecialPurposeGeneral";
    name[161] = "Daymark";
    name[162] = "LightFloat";
    name[163] = "LightVessel";
    name[164] = "Retroreflector";
    name[165] = "RadarReflector";
    name[166] = "FogSignal";
    name[167] = "PhysicalAisAidToNavigation";
    name[168] = "VirtualAisAidToNavigation";
    name[169] = "RadioStation";
    name[170] = "RadarTransponderBeacon";
    name[171] = "PilotBoardingPlace";
    name[172] = "VesselTrafficServiceArea";
    name[173] = "CoastguardStation";
    name[174] = "SignalStationWarning";
    name[175] = "SignalStationTraffic";
    name[176] = "RescueStation";
    name[177] = "HarbourFacility";
    name[178] = "SmallCraftFacility";
    name[179] = "TextPlacement";
    return name;
}

map<int, string> raw_clazz = get_raw_clazz();

ComplexAttrDescriptor::multiplicity loadMultiplicity(XMLElement *upperRoot) {
    XMLElement *mult = upperRoot->FirstChildElement("S100FC:multiplicity");
    int low = mult->FirstChildElement("S100Base:lower")->IntText(0);
    int high = mult->FirstChildElement("S100Base:upper")->IntText(-1);
    return ComplexAttrDescriptor::multiplicity{low, high};
}

Catalogue load_catalogue() {
    Catalogue data;

    XMLDocument catalogue;
    catalogue.LoadFile("S-101FC.xml");
    pXElem cat_root = catalogue.FirstChildElement("S100FC:S100_FC_FeatureCatalogue");
    pXElem attr = cat_root->FirstChildElement("S100FC:S100_FC_SimpleAttributes")->FirstChildElement();

    int i = 1;
    for (; attr != nullptr; attr = attr->NextSiblingElement(), i++) {
        string name = attr->FirstChildElement("S100FC:code")->GetText();
        string type = attr->FirstChildElement("S100FC:valueType")->GetText();
        data.attributes_simple_by_id[i] = SimpleAttrDescriptor(name, type);
        data.attributes_simple[name] = &data.attributes_simple_by_id[i];
    }
//    print_attr_types(data.attributes_simple_by_id);

    attr = cat_root->FirstChildElement("S100FC:S100_FC_ComplexAttributes")->FirstChildElement();
    for (; attr != nullptr; attr = attr->NextSiblingElement(), i++) {
        string name = attr->FirstChildElement("S100FC:code")->GetText();
        ComplexAttrDescriptor complex_feat(name);

        iter_xml(attr, "S100FC:subAttributeBinding", b) {
            const char *ref = b->FirstChildElement("S100FC:attribute")->Attribute("ref");
            if (data.attributes_simple.count(ref)) {
                auto val = std::make_pair(data.attributes_simple[ref], loadMultiplicity(b));
                complex_feat.sub_attrs_simple.insert({ref, val});
                if (b->FirstChildElement("S100FC:permittedValues") != nullptr) {
                    iter_xml(b->FirstChildElement("S100FC:permittedValues"), "S100FC:value", value) {
                        complex_feat.permitted_values[ref].insert(value->GetText());
                    }
                }
            } else {
                complex_feat.sub_attrs_complex.insert({ref, loadMultiplicity(b)});
            }
        }
        data.attributes_complex_by_id[i] = std::move(complex_feat);
        data.attributes_complex[name] = &data.attributes_complex_by_id[i];
    }

    iter_xml(cat_root->FirstChildElement("S100FC:S100_FC_FeatureTypes"), nullptr, feat) {
        string name = feat->FirstChildElement("S100FC:code")->GetText();
        ComplexAttrDescriptor clazz(name);
        iter_xml(feat, "S100FC:attributeBinding", b) {
            const char *ref = b->FirstChildElement("S100FC:attribute")->Attribute("ref");
            if (data.attributes_simple.count(ref)) {
                clazz.sub_attrs_simple.insert({ref, {data.attributes_simple[ref], loadMultiplicity(b)}});
            } else {
                clazz.sub_attrs_complex.insert({ref, loadMultiplicity(b)});
            }
        }
        for (const auto &x : raw_clazz) {
            if (x.second == clazz.name) {
                data.feats_by_id[x.first] = std::move(clazz);
                data.feats[name] = &data.feats_by_id[x.first];
                break;
            }
        }
    }

    return data;
}

void annotate_map() {
    std::ifstream in("map.xml");
    std::ofstream out("map2.xml");
    string line;
    Catalogue data = load_catalogue();
    while (!std::getline(in, line).eof()) {
        out << line;
        auto pos = line.find("<Class>");
        if (pos != string::npos) {
            const char *number = line.data() + pos + 7;
            out << " <!--" << data.feats_by_id[std::stoi(number)].name << "-->";
        }
        pos = line.find("<code>");
        if (pos != string::npos) {
            try {
                const char *number = line.data() + pos + 6;
                int num = std::stoi(number);
                out << " <!--" << data.attributes_simple_by_id[num].name << ":"
                    << data.attributes_simple_by_id[num].type << "-->";
            } catch (std::invalid_argument &argument) {}
        }
        out << "\n";
    }
    out.flush();
    out.close();
}

void test_class(ComplexAttrDescriptor &desc, XMLElement *root, int id, int clazz, Catalogue &data,
                const std::string &prefix = "") {
    std::map<std::string, int> count;
    iter_xml(root, nullptr, e) {
        std::string node_type = e->Value();
        if (node_type == "complex_attrs") {
            iter_xml(e, nullptr, t) {
                int code = t->FirstChildElement("code")->IntText(-1);
                count[data.attributes_complex_by_id[code].name]++;
                test_class(data.attributes_complex_by_id[code], t, id, clazz, data,
                           prefix + data.attributes_complex_by_id[code].name + "/");
            }
        } else if (node_type == "int_attrs") {
            iter_xml(e, nullptr, t) {
                int code = t->FirstChildElement("code")->IntText(-1);
                auto &sub_name = data.attributes_simple_by_id[code].name;
                if (desc.sub_attrs_simple.count(sub_name) == 0) {
                    std::cerr << "Feature " << id << " of class " << raw_clazz[clazz] << " has no attribute "
                              << prefix << sub_name << "\n";
                } else {
                    count[sub_name]++;
                    if (desc.permitted_values.count(sub_name)) {
                        const char *text = t->FirstChildElement("value")->GetText();
                        if (text == nullptr)
                            text = "";
                        if (desc.permitted_values[sub_name].count(text) == 0) {
                            std::cerr << "Feature " << id << " of class " << raw_clazz[clazz]
                                      << " has invalid enum attribute " << prefix << sub_name << " (" << text << ")\n";
                        }
                    }
                }
            }
        } else if (node_type == "double_attrs" || node_type == "string_attrs" || node_type == "list_attrs") {
            iter_xml(e, nullptr, t) {
                int code = t->FirstChildElement("code")->IntText(-1);
                auto &sub_name = data.attributes_simple_by_id[code].name;
                count[sub_name]++;
                if (desc.sub_attrs_simple.count(sub_name) == 0) {
                    std::cerr << "Feature " << id << " of class " << raw_clazz[clazz] << " has no attribute "
                              << prefix << sub_name << "\n";
                }
            }
        }
    }
    for (auto &attr : count) {
        ComplexAttrDescriptor::multiplicity mult = {};
        if (desc.sub_attrs_simple.count(attr.first)) {
            mult = desc.sub_attrs_simple[attr.first].second;
        } else {
            mult = desc.sub_attrs_complex[attr.first];
        }
        if (mult.upper >= 0 && mult.upper < attr.second) {
            std::cerr << "Feature " << id << " of class " << raw_clazz[clazz] << " has too many attributes "
                      << prefix << attr.first << "\n";
        }
        if (mult.lower > attr.second) {
            std::cerr << "Feature " << id << " of class " << raw_clazz[clazz] << " has too low attributes "
                      << prefix << attr.first << "\n";
        }
    }
}

void test_classes(const std::string &name) {
    XMLDocument map;
    map.LoadFile(name.c_str());
    Catalogue data = load_catalogue();

    pXElem tz = map.FirstChildElement();
    set<string> unused;

    iter_xml(tz, "features", feature) {
        int id, clazz;
        id = std::stoi(feature->FirstChildElement("ID")->FirstChild()->Value());
        clazz = std::stoi(feature->FirstChildElement("Class")->FirstChild()->Value());
        test_class(data.feats_by_id[clazz], feature, id, clazz, data);
//        std::cerr << "Feature " << id << ": " << hits << " hits\n";
    }
    for (auto &s : unused) {
//        std::cerr << "Unused tag " << s << "\n";
    }
}

SimpleAttrDescriptor::SimpleAttrDescriptor(const string &name, const string &type) : name(name), type(type) {
    if (type == "text") {
        type_id = Text;
    } else if (type == "real") {
        type_id = Real;
    } else if (type == "integer") {
        type_id = Int;
    } else if (type == "boolean") {
        type_id = Bool;
    } else if (type == "S100_TruncatedDate") {
        type_id = Date;
    } else if (type == "time") {
        type_id = Time;
    } else if (type == "enumeration") {
        type_id = Enum;
    } else {
        throw std::invalid_argument(type + " is unknown type of simple attribute value");
    }
}

ComplexAttrDescriptor::ComplexAttrDescriptor(const string &name) : name(name) {}

std::pair<std::string, std::string>
getCodeValueSimple(XMLElement *attr, const Catalogue &catalogue, bool isComplexAttribute = false) {
    int codeInt = attr->FirstChildElement("code")->IntText(-1);
    std::string code2 = attr->FirstChildElement("alias")->GetText();
    if (isComplexAttribute) {
        std::string code = catalogue.attributes_complex_by_id.find(codeInt)->second.name;
        if (code2 != code) {
            assert(code2 == code);
        }
        return {code, ""};
    } else {
        std::string code = catalogue.attributes_simple_by_id.find(codeInt)->second.name;
        if (code2 != code) {
            assert(code2 == code);
        }
        const char *textValue = attr->FirstChildElement("value")->GetText();
        if (textValue == nullptr)
            textValue = "";
        return {code, textValue};
    }
}


typedef std::multimap<std::string, XMLElement *> child_map;

struct erasing_map {
    child_map &map;
    std::set<std::string> requests;

    explicit erasing_map(child_map &map) : map(map) {}

    auto equal_range(const std::string &param) {
        requests.insert(param);
        return map.equal_range(param);
    }

    ~erasing_map() {
        for (auto &str : requests)
            map.erase(str);
    }
};

child_map getElementsMap(XMLElement *root) {
    child_map mmap;
    iter_xml(root, nullptr, x) {
        mmap.insert({x->Value(), x});
    }
    return mmap;
}

ComplexAttr readComplexAttr(child_map &map2, const Catalogue &catalogue) {
    ComplexAttr attr;
    erasing_map map(map2);

    for (auto range = map.equal_range("double_attrs"); range.first != range.second; range.first++) {
        iter_xml(range.first->second, "double_attr", ch) {
            auto codeValue = getCodeValueSimple(ch, catalogue);
            attr.real_attrs.insert({codeValue.first, std::stod(codeValue.second)});
        }
    }

    for (auto range = map.equal_range("int_attrs"); range.first != range.second; range.first++) {
        iter_xml(range.first->second, "int_attr", ch) {
            auto codeValue = getCodeValueSimple(ch, catalogue);
            attr.int_attrs.insert({codeValue.first, std::stoi(codeValue.second)});
        }
    }

    for (auto range = map.equal_range("list_attrs"); range.first != range.second; range.first++) {
        iter_xml(range.first->second, "list_attr", ch) {
            auto codeValue = getCodeValueSimple(ch, catalogue);
            std::replace(codeValue.second.begin(), codeValue.second.end(), ',', ' ');
            std::istringstream iss(codeValue.second);
            std::vector<int> values{std::istream_iterator<int>{iss}, std::istream_iterator<int>{}};
            for (auto x : values) {
                attr.int_attrs.insert({codeValue.first, x});
            }
        }
    }

    for (auto range = map.equal_range("string_attrs"); range.first != range.second; range.first++) {
        iter_xml(range.first->second, "string_attr", ch) {
            auto codeValue = getCodeValueSimple(ch, catalogue);
            attr.string_attrs.insert({codeValue.first, codeValue.second});
        }
    }

    map.equal_range("list_complex_attrs");

    for (auto range = map.equal_range("complex_attrs"); range.first != range.second; range.first++) {
        iter_xml(range.first->second, "complex_attr", ch) {
            auto elementsMap = getElementsMap(ch);
            auto childAttr = readComplexAttr(elementsMap, catalogue);
            auto code = getCodeValueSimple(ch, catalogue, true);
            attr.compl_attrs.insert({code.first, childAttr});
        }
//        throw std::invalid_argument("Complex attributes not implemented");
    }

//    for (auto range = map.equal_range("list_complex_attrs"); range.first != range.second; range.first++) {
//        iter_xml(range.first->second, "list_complex_attr", ch) {
//            auto elementsMap = getElementsMap(ch);
//            auto childAttr = readComplexAttr(elementsMap, catalogue);
//            auto code = getCodeValueSimple(ch, catalogue, true);
//            attr.compl_attrs.insert({code.first, childAttr});
//        }
//        throw std::invalid_argument("Complex attributes not implemented");
//    }
    attr.RecalcAttrCount();
    return attr;
}

int spatialCount = 1;
map<int, int> spatialsMap;

int getSpatialId(int prevId) {
    return prevId;
    auto p = spatialsMap.find(prevId);
    if (p == spatialsMap.end()) {
        spatialsMap[prevId] = ++spatialCount;
        return spatialCount;
    } else {
        return p->second;
    }
}

SpatialReference readSpatial(XMLElement *root, TestObjectDrawer &drawer, int scamin = -100, int scamax = -100) {
    int id = root->FirstChildElement("ref_id")->IntText(-100);
    int ref_type = root->FirstChildElement("ref_type")->IntText(-100);
    int orientation = root->FirstChildElement("orientation")->IntText(-100);
    if (root->FirstChildElement("scamin") != nullptr)
        scamin = root->FirstChildElement("scamin")->IntText(scamin);
    if (root->FirstChildElement("scamax") != nullptr)
        scamax = root->FirstChildElement("scamax")->IntText(scamax);
    if (id == -100 || ref_type == -100 || orientation == -100 || scamin == -100 || scamax == -100) {
        throw std::logic_error("Invalid spatial");
    }
    id = getSpatialId(id);
    Spatial spat(id, ref_type, scamin, scamax);
    double lat, lon;
    switch (ref_type) {
        case SpatialReferenceType::Point:
            lat = root->FirstChildElement("isolated_point")->FirstChildElement("lat")->DoubleText(1e9);
            lon = root->FirstChildElement("isolated_point")->FirstChildElement("lon")->DoubleText(1e9);
            assert(lat != 1e9 && lon != 1e9);
            spat.setGeoPoint(lat, lon);
            break;
        case SpatialReferenceType::Curve:
            iter_xml(root->FirstChildElement("edge")->FirstChildElement("geo_points"), "geo_point", x) {
                lat = x->FirstChildElement("lat")->DoubleText(1e9);
                lon = x->FirstChildElement("lon")->DoubleText(1e9);
                assert(lat != 1e9 && lon != 1e9);
                spat.addGeoPoint(lat, lon);
            }
            break;
        case SpatialReferenceType::CompositeCurve:
            iter_xml(root->FirstChildElement("composite_edge"), "sp2sp_ref", x) {
                auto sub_spat = readSpatial(x, drawer, scamin, scamax);
                spat.addReference(sub_spat.SpatialID, orientation, sub_spat.SpatialType);
            }
            break;
        case SpatialReferenceType::Surface:
            iter_xml(root->FirstChildElement("surface"), "sp2sp_ref", x) {
                auto sub_spat = readSpatial(x, drawer, scamin, scamax);
                spat.addReference(sub_spat.SpatialID, orientation, sub_spat.SpatialType);
            }
            break;
        default:
            throw std::logic_error("Unknown ref_type");
    }
    drawer.AddSpatial(std::move(spat));
    return {id, orientation, ref_type};
}

void verifyMaps() {
    string pref("maps/");
    for (auto &map : getGeneratedLists().maps) {
        auto name = pref + map;
        std::cerr << map << "\n";
        readFromXML(name);
        test_classes(name);
    }
    std::cerr << "Done verifying\n";
}

void addFeaturesFromRoot(XMLElement *root, TestObjectDrawer &drawer, set<string> &unused, std::map<string, int> &excs,
                         int startId = 0) {
    iter_xml(root, "features", f) {
        int index = f->FirstChildElement("ID")->IntText(-1);
        std::multimap<string, XMLElement *> elements = getElementsMap(f);
        try {
            int clazz = f->FirstChildElement("Class")->IntText(-1);
            if (elements.count("fe2sp_ref") > 1) {
                std::cerr << "multielement " << f->GetLineNum() << "\n";
            }
            SpatialReference spatial;
            if (f->FirstChildElement("fe2sp_ref") != nullptr)
                spatial = readSpatial(f->FirstChildElement("fe2sp_ref"), drawer);
            ComplexAttr core = readComplexAttr(elements, drawer.GetCatalogue());

            ComplexAttr fname;
            fname.string_attrs.insert({"name", raw_clazz[clazz]});
            fname.RecalcAttrCount();
            core.compl_attrs.insert({"featureName", fname});
            core.RecalcAttrCount();

            if (startId != 0) {
                index = startId++;
            }

            drawer.AddFeature(Feature(spatial, clazz, core), index);

        } catch (std::exception &exception) {
            excs[exception.what()]++;
        }
        for (const auto &x : elements) {
            unused.insert(x.first);
        }
    }
}

TestObjectDrawer readFromAllXML() {
    TestObjectDrawer drawer;

    drawer.SetCatalogue(load_catalogue());

    XMLDocument mapxml;
    set<string> unused;
    std::map<string, int> excs;
    string pref("maps/");

    for (auto &map : getGeneratedLists().maps) {
        auto name = pref + map;
        std::cerr << "Loading " << map << "\n";
        mapxml.LoadFile(name.c_str());
        addFeaturesFromRoot(mapxml.FirstChildElement(), drawer, unused, excs, drawer.GetFeatureCount() + 1);
    }


    for (auto &x  :excs) {
        std::cerr << "Parse exception '" << x.first << "': " << x.second << " times\n";
    }
    for (auto &x : unused) {
//        std::cerr << "Once unparsed element " << x << "\n";
    }
    return drawer;
}

TestObjectDrawer readFromXML(const std::string &name) {
    TestObjectDrawer drawer;

    drawer.SetCatalogue(load_catalogue());

    XMLDocument map;
    map.LoadFile(name.c_str());

    set<string> unused;

    std::map<string, int> excs;

    addFeaturesFromRoot(map.FirstChildElement(), drawer, unused, excs);
    for (auto &x  :excs) {
        std::cerr << "Parse exception '" << x.first << "': " << x.second << " times\n";
    }
    for (auto &x : unused) {
//        std::cerr << "Once unparsed element " << x << "\n";
    }

    return drawer;
}