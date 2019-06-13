//
// Created by ME on 10.05.2019.
//

#ifndef PROJECT_MODLUA_H
#define PROJECT_MODLUA_H

#include "TestObjectDrawer.h"
#include <vector>

int runModifiedLuaLong(TestObjectDrawer &drawer, const std::string &prefix, int runs, const std::vector<int> &features);

int
runModifiedLuaShort(TestObjectDrawer &drawer, const std::string &prefix, int runs, const std::vector<int> &features);

int runModifiedLuaCold(TestObjectDrawer &drawer, const std::string &prefix, int runs, const std::vector<int> &features);

int
runModifiedLuaCreate(TestObjectDrawer &drawer, const std::string &prefix, int runs, const std::vector<int> &features);

#endif //PROJECT_MYLUA_H
