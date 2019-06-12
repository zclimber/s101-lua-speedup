//
// Created by ME on 10.05.2019.
//

#ifndef PROJECT_MODLUA_H
#define PROJECT_MODLUA_H

#include "TestObjectDrawer.h"
#include <vector>

int runModifiedLua(TestObjectDrawer &drawer, const std::string &prefix, int warmup, int runs,
                   const std::vector<int> &features = std::vector<int>());

#endif //PROJECT_MYLUA_H
