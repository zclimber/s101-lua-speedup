add_executable(dynamic main.cpp)

target_link_libraries(dynamic tinyxml)

target_include_directories(dynamic PRIVATE "${PROJECT_SOURCE_DIR}/lib/tinyxml")