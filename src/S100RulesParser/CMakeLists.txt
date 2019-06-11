set(CMAKE_CXX_STANDARD 14)

include_directories(${PROJECT_SOURCE_DIR})

add_library(cpp_portrayal STATIC
        ChooseRule.h private/ChooseRule.cpp
        private/AttrCodes.h
        private/ClassCodes.h
        private/GenRules.h private/GenRules.cpp
        private/S101Primitives.h private/S101Primitives.cpp)

set_target_properties(cpp_portrayal PROPERTIES LINKER_LANGUAGE CXX)

target_include_directories(cpp_portrayal PRIVATE "${PROJECT_SOURCE_DIR}/src")

target_sources(dynamic PRIVATE ChooseRule.h)
target_link_libraries(dynamic cpp_portrayal)