cmake_minimum_required(VERSION 3.12)
project(Ex3 C)

set(CMAKE_C_STANDARD 99)
add_library(Ex3 calc.c)

add_executable(MainProg calc.c)