//
// Created by ME on 10.05.2019.
//

#ifndef PROJECT_MYLUA_H
#define PROJECT_MYLUA_H

#include <vector>
#include "TestObjectDrawer.h"

int runMyLua(TestObjectDrawer &drawer, const std::string &prefix, int warmup, int runs,
             const std::vector<int> &features = std::vector<int>());

#endif //PROJECT_MYLUA_H
