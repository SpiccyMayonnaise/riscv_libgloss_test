cmake_minimum_required(VERSION 3.28)

include(rvenv-setup-sdk.cmake)

project(riscv_libgloss_test C)

set(CMAKE_C_STANDARD 11)

add_executable(riscv_libgloss_test main.c)
