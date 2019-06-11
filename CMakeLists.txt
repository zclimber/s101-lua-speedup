cmake_minimum_required(VERSION 3.14)
project(dynamic LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 14)
link_directories(${PROJECT_SOURCE_DIR})

add_subdirectory(lib)
add_subdirectory(src)
