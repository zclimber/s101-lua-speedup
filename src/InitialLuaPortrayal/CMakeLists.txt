set(CMAKE_CXX_STANDARD 14)

add_library(initial_lua_portrayal STATIC
        InitialLua.h InitialLua.cpp)

set_target_properties(initial_lua_portrayal PROPERTIES LINKER_LANGUAGE CXX)

target_include_directories(initial_lua_portrayal PRIVATE "${PROJECT_SOURCE_DIR}/src")
target_include_directories(initial_lua_portrayal PRIVATE "${PROJECT_SOURCE_DIR}/lib")

target_sources(dynamic PRIVATE InitialLua.h)
target_link_libraries(dynamic initial_lua_portrayal)