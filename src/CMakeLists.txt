add_executable(dynamic
        main.cpp
        Spatial.h Spatial.cpp
        IAttrContainer.h
        ICatalogue.h
        IObjectDrawer.h
        TestObjectDrawer.h TestObjectDrawer.cpp
        GeneratedLists.h GeneratedLists.h
        XmlLoader.h XmlLoader.h
        S100RulesParser/private/S101Primitives.h S100RulesParser/private/S101Primitives.cpp)

target_link_libraries(dynamic tinyxml)

target_include_directories(dynamic PRIVATE "${PROJECT_SOURCE_DIR}/lib")
target_include_directories(dynamic PRIVATE "${PROJECT_SOURCE_DIR}/src")