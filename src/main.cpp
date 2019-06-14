#include <iostream>
#include <fstream>
#include <chrono>
#include <vector>

#include "XmlLoader.h"
#include "S100RulesParser/ChooseRule.h"
#include "InitialLuaPortrayal/InitialLua.h"
#include "OptimizedLuaPortrayal/OptimizedLua.h"
#include "ConvertedLuaPortrayal/ConvertedLua.h"
#include "GeneratedLists.h"

void doTest(TestObjectDrawer &drawer, std::vector<int> &testFeatures, const int countRuns, bool drawCalls = false);

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

    std::string m = "maps/";
    std::vector<std::string> maps = {"101CA00173289", "101CA00273313", "101CA00376166", "101CA00470351",
                                     "101CA00573356", "101CA00673225"};
    std::vector<int> testFeatures;
//    const int countRuns = 1;
    const int countRuns = 500;
    for (auto &x : maps) {
        std::cout << x << "\n";
        TestObjectDrawer drawer = readFromXML(m + x + ".usf.xml");
        doTest(drawer, testFeatures, countRuns);
    }


//    std::vector<int> excluded = {11735, 11746, 11724, 11744, 11745, 12691, 12694, 12695, 12720, 12721, 12669, 12670,
//                                 12671, 12672, 12673, 12674, 12675, 12676, 11748};
//    for (auto x : excluded)
//        drawer.RemoveFeature(x);
//    TestObjectDrawer drawer = readFromAllXML();
//    return 0;

    return 0;
}

void doTest(TestObjectDrawer &drawer, std::vector<int> &testFeatures, const int countRuns, bool drawCalls) {
    const int warmupRuns = std::min(500, countRuns / 5);

//    printCatalogueStuff(drawer);

    int th[4] = {-1, -1, -1, -1}; // 0 13577 9918, 635 features
    int conv[4];
    int opt[4];
    int cpp = 0;
    printTypes(drawer, testFeatures);
    for (int i = 0; i < warmupRuns + countRuns; i++) {
        timer t;
        if (testFeatures.empty()) {
            drawer.RunOnAllFeatures(ChooseRule, "out\\cpp\\");
        } else {
            drawer.RunOnSetFeatures(ChooseRule, "out\\cpp\\", testFeatures);
        }
        int rs = t.stop();
        if (i == warmupRuns + countRuns - 1) {
            std::cerr.flush();
            std::cout << drawer.drawCalls << " draw calls\n";
            std::cerr.flush();
        }
        if (i >= warmupRuns)
            cpp += rs;
    }
    th[0] = runInitialLuaCold(drawer, "out\\thlua\\", countRuns, testFeatures);
    if (drawCalls) {
        std::cerr.flush();
        std::cout << drawer.drawCalls / (countRuns) << " draw calls\n";
        std::cerr.flush();
    }

    opt[0] = runModifiedLuaCold(drawer, "out\\modlua\\", countRuns, testFeatures);
    if (drawCalls) {
        std::cerr.flush();
        std::cout << drawer.drawCalls / (countRuns) << " draw calls\n";
        std::cerr.flush();
    }
//
    conv[0] = runMyLuaCold(drawer, "out\\modlua\\", countRuns, testFeatures);
    if (drawCalls) {
        std::cerr.flush();
        std::cout << drawer.drawCalls / (countRuns) << " draw calls\n";
        std::cerr.flush();
    }

    th[1] = runInitialLuaShort(drawer, "out\\thlua\\", countRuns, testFeatures);
    opt[1] = runModifiedLuaShort(drawer, "out\\modlua\\", countRuns, testFeatures);
    conv[1] = runMyLuaShort(drawer, "out\\modlua\\", countRuns, testFeatures);
    th[2] = runInitialLuaLong(drawer, "out\\thlua\\", countRuns, testFeatures);
    opt[2] = runModifiedLuaLong(drawer, "out\\modlua\\", countRuns, testFeatures);
    conv[2] = runMyLuaLong(drawer, "out\\modlua\\", countRuns, testFeatures);
    th[3] = runInitialLuaCreate(drawer, "out\\thlua\\", countRuns, testFeatures);
    opt[3] = runModifiedLuaCreate(drawer, "out\\modlua\\", countRuns, testFeatures);
    conv[3] = runMyLuaCreate(drawer, "out\\modlua\\", countRuns, testFeatures);

    for (int i = 0; i < 4; i++) {
        std::cout << th[i] / countRuns << ";";
        std::cout << opt[i] / countRuns << ";";
        std::cout << conv[i] / countRuns << ";";
        std::cout << cpp / countRuns << "\n";
//        std::cout << "Initial Lua  : " << th / countRuns << " usec\n";
//        std::cout << "Optimized Lua: " << opt / countRuns << " usec\n";
//        std::cout << "Converted Lua: " << conv / countRuns << " usec\n";
//        std::cout << "Converted C++: " << cpp / countRuns << " usec\n";
    }
}