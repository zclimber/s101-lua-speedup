//
// Created by ME on 10.05.2019.
//

#ifndef PROJECT_MYLUA_H
#define PROJECT_MYLUA_H

#include <vector>
#include "TestObjectDrawer.h"

int runMyLuaLong(TestObjectDrawer &drawer, const std::string &prefix, int runs, const std::vector<int> &features);

int runMyLuaShort(TestObjectDrawer &drawer, const std::string &prefix, int runs, const std::vector<int> &features);

int runMyLuaCold(TestObjectDrawer &drawer, const std::string &prefix, int runs, const std::vector<int> &features);

int runMyLuaCreate(TestObjectDrawer &drawer, const std::string &prefix, int runs, const std::vector<int> &features);


#endif //PROJECT_MYLUA_H