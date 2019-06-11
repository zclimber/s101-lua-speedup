set(CMAKE_CXX_STANDARD 14)

add_library(conv_lua_portrayal STATIC ConvertedLua.cpp ConvertedLua.h ConvertedLuaInterface.h)

set_target_properties(conv_lua_portrayal PROPERTIES LINKER_LANGUAGE CXX)

target_include_directories(conv_lua_portrayal PRIVATE "${PROJECT_SOURCE_DIR}/src")
target_include_directories(conv_lua_portrayal PRIVATE "${PROJECT_SOURCE_DIR}/lib")

target_sources(dynamic PRIVATE ConvertedLua.h)
target_link_libraries(dynamic conv_lua_portrayal)