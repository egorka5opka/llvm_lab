cmake_minimum_required(VERSION 3.13)
project(MyPass LANGUAGES CXX)

find_package(LLVM REQUIRED CONFIG)
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
include(AddLLVM)

add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS})

add_library(MyPass MODULE insert_log_pass.cpp)

set_target_properties(MyPass PROPERTIES
    COMPILE_FLAGS "-fno-rtti"
)