//
// Created by ME on 08.04.2019.
//

#ifndef PROJECT_THEIRLUA_H
#define PROJECT_THEIRLUA_H

#include <vector>
#include "lua/lua.hpp"
#include "TestObjectDrawer.h"

int runInitialLuaLong(TestObjectDrawer &testObjectDrawer, const std::string &prefix, int runs,
                      const std::vector<int> &features);

int runInitialLuaShort(TestObjectDrawer &testObjectDrawer, const std::string &prefix, int runs,
                       const std::vector<int> &features);

int runInitialLuaCold(TestObjectDrawer &testObjectDrawer, const std::string &prefix, int runs,
                      const std::vector<int> &features);

int runInitialLuaCreate(TestObjectDrawer &testObjectDrawer, const std::string &prefix, int runs,
                        const std::vector<int> &features);

#endif //PROJECT_THEIRLUA_H
