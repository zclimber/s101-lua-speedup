//
// Created by ME on 30.05.2019.
//

#ifndef PROJECT_GENERATEDLISTS_H
#define PROJECT_GENERATEDLISTS_H

#include <vector>
#include <string>

struct GeneratedLists {
    std::vector<int> featuresList;
    std::vector<std::string> maps;

    GeneratedLists();
};

const GeneratedLists &getGeneratedLists();


#endif //PROJECT_GENERATEDLISTS_H
