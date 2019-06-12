set(CMAKE_CXX_STANDARD 14)

add_library(opt_lua_portrayal STATIC OptimizedLua.cpp OptimizedLua.h OptimizedLuaInterface.h)

set_target_properties(opt_lua_portrayal PROPERTIES LINKER_LANGUAGE CXX)

target_include_directories(opt_lua_portrayal PRIVATE "${PROJECT_SOURCE_DIR}/src")
target_include_directories(opt_lua_portrayal PRIVATE "${PROJECT_SOURCE_DIR}/lib")

target_sources(dynamic PRIVATE OptimizedLua.h)
target_link_libraries(dynamic opt_lua_portrayal)