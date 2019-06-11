add_executable(dynamic
        main.cpp
        Spatial.h Spatial.cpp
        IAttrContainer.h
        ICatalogue.h
        IObjectDrawer.h
        TestObjectDrawer.h TestObjectDrawer.cpp
        GeneratedLists.h GeneratedLists.cpp
        XmlLoader.h XmlLoader.cpp
        S100RulesParser/private/S101Primitives.h S100RulesParser/private/S101Primitives.cpp
        LuaUtil.cpp LuaUtil.h)

add_subdirectory(S100RulesParser)
add_subdirectory(InitialLuaPortrayal)

target_link_libraries(dynamic tinyxml)
target_link_libraries(dynamic lua51)

target_include_directories(dynamic PRIVATE "${PROJECT_SOURCE_DIR}/lib")
target_include_directories(dynamic PRIVATE "${PROJECT_SOURCE_DIR}/src")