//
// Created by ME on 08.04.2019.
//

#ifndef PROJECT_THEIRLUA_H
#define PROJECT_THEIRLUA_H

#include <vector>
#include "lua/lua.hpp"
#include "TestObjectDrawer.h"

int runInitialLua(TestObjectDrawer &testObjectDrawer, const std::string &prefix, int warmup, int runs,
                  const std::vector<int> &features = std::vector<int>());

#endif //PROJECT_THEIRLUA_H
