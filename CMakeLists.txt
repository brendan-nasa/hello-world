cmake_minimum_required(VERSION 3.20)
project(hello-world VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(hello
    src/hello_world.cpp
)

target_include_directories(hello PRIVATE src)

install(TARGETS hello)
