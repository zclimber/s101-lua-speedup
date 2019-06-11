#include <iostream>
#include <fstream>
#include <chrono>
#include <vector>

#include "XmlLoader.h"
#include "S100RulesParser/ChooseRule.h"
#include "InitialLuaPortrayal/InitialLua.h"
//#include "ModLua/ModLua.h"
//#include "MyLua/MyLua.h"
#include "GeneratedLists.h"

void printCatalogueStuff(TestObjectDrawer &drawer) {
    for (const auto &x : drawer.GetCatalogue().attributes_complex) {
        std::cout << x.first << " = 'complex',\n";
    }

    for (const auto &x : drawer.GetCatalogue().attributes_simple) {
        std::cout << x.first << " = '" << x.second->type << "',\n";
    }

    std::map<std::string, std::vector<std::string>> multis;

    for (const auto &x : drawer.GetCatalogue().attributes_complex) {
        bool is = false;
        for (const auto &y : x.second->sub_attrs_complex) {
            if (y.second.upper != 1) {
                multis[y.first].push_back(x.first);
            }
        }
        for (const auto &y : x.second->sub_attrs_simple) {
            if (y.second.second.upper != 1) {
                multis[y.first].push_back(x.first);
            }
        }
    }
    for (const auto &x : drawer.GetCatalogue().feats) {
        bool is = false;
        for (const auto &y : x.second->sub_attrs_complex) {
            if (y.second.upper != 1) {
                multis[y.first].push_back(x.first);
            }
        }
        for (const auto &y : x.second->sub_attrs_simple) {
            if (y.second.second.upper != 1) {
                multis[y.first].push_back(x.first);
            }
        }
    }

    for (auto &attr : multis) {
        std::cout << "mult['" << attr.first << "'] = {}\n";
        for (auto &obj : attr.second) {
            std::cout << "mult['" << attr.first << "']['" << obj << "'] = true\n";
        }
    }
    exit(0);
}

void printTypes(const TestObjectDrawer &drawer, std::vector<int> &testFeatures) {
    std::map<std::string, int> types;
    std::vector<int> LandAreas;
    for (auto x : testFeatures) {
        int c = drawer.GetFeature(x).GetClass();
        types[drawer.GetCatalogue().feats_by_id.find(c)->second.name]++;
        if (drawer.GetCatalogue().feats_by_id.find(c)->second.name != "LandArea") {
            LandAreas.push_back(x);
        }
    }
    for (const auto &x : types) {
        std::cout << x.first << ": " << x.second << "\n";
    }
    swap(testFeatures, LandAreas);
}

int main() {
//    annotate_map();
//    freopen("out.txt", "w", stdout);
//    freopen("err.txt", "w", stderr);

    TestObjectDrawer drawer = readFromXML("maps/101CA00270084.usf.xml");
//    TestObjectDrawer drawer = readFromAllXML();
//    return 0;
    std::vector<int> testFeatures;// = getGeneratedLists().featuresList;

    const int countRuns = 1;
//    const int countRuns = 100;
    const int warmupRuns = std::min(500, countRuns / 5);

//    printCatalogueStuff(drawer);

    int cpp = 0;
    int th = 0; // 0 13577 9918, 635 features
    int mod = 0;
    int my = 0;
    printTypes(drawer, testFeatures);
    for (int i = 0; i < warmupRuns + countRuns; i++) {
        timer t;
        if (testFeatures.empty()) {
            drawer.RunOnAllFeatures(ChooseRule, "out\\cpp\\");
        } else {
            drawer.RunOnSetFeatures(ChooseRule, "out\\cpp\\", testFeatures);
        }
        int rs = t.stop();
        if (i == 0) {
            std::cerr.flush();
            std::cout << drawer.drawCalls << " draw calls\n";
            std::cerr.flush();
        }
        if (i >= warmupRuns)
            cpp += rs;
    }
    th = runInitialLua(drawer, "out\\thlua\\", warmupRuns, countRuns, testFeatures);
    std::cerr.flush();
    std::cout << drawer.drawCalls / (warmupRuns + countRuns) << " draw calls\n";
    std::cerr.flush();

//    mod = runModifiedLua(drawer, "out\\modlua\\", warmupRuns, countRuns, testFeatures);
//    std::cerr.flush();
//    std::cout << drawer.drawCalls / (warmupRuns + countRuns) << " draw calls\n";
//    std::cerr.flush();
//
//    my = runMyLua(drawer, "out\\modlua\\", warmupRuns, countRuns, testFeatures);
//    std::cerr.flush();
//    std::cout << drawer.drawCalls / (warmupRuns + countRuns) << " draw calls\n";
//    std::cerr.flush();

    std::cout << cpp / countRuns << " " << th / countRuns;// << " " << mod / countRuns << " " << my / countRuns;


//    drawer.GetMutableContext().SetIsSymbolizedAreas(false);
//    drawer.GetMutableContext().SetIsSimplifiedPoints(true);
//    drawer.RunOnAllFeatures(ChooseRule, "out\\cpp\\");
//    runTheirLua(drawer, "out\\thlua\\");
//
//    drawer.GetMutableContext().SetIsSymbolizedAreas(false);
//    drawer.GetMutableContext().SetIsSimplifiedPoints(false);
//    drawer.RunOnAllFeatures(ChooseRule, "out\\cpp\\");
//    runTheirLua(drawer, "out\\thlua\\");
//
//    drawer.GetMutableContext().SetIsSymbolizedAreas(true);
//    drawer.GetMutableContext().SetIsSimplifiedPoints(true);
//    drawer.RunOnAllFeatures(ChooseRule, "out\\cpp\\");
//    runTheirLua(drawer, "out\\thlua\\");
//
//    drawer.GetMutableContext().SetIsSymbolizedAreas(true);
//    drawer.GetMutableContext().SetIsSimplifiedPoints(false);
//    drawer.RunOnAllFeatures(ChooseRule, "out\\cpp\\");
//    runTheirLua(drawer, "out\\thlua\\");
    return 0;
}