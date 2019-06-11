//
// Created by ME on 07.04.2019.
//

#ifndef PROJECT_XML_LOADER_H
#define PROJECT_XML_LOADER_H

#include "ICatalogue.h"

#include <string>
#include <map>
#include <set>

#include "TestObjectDrawer.h"

Catalogue load_catalogue();

TestObjectDrawer readFromXML(const std::string &name);

TestObjectDrawer readFromAllXML();

void annotate_map();

void test_classes(const std::string &name);

#endif //PROJECT_XML_LOADER_H
