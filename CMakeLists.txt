cmake_minimum_required(VERSION 3.28)

include(rvenv-setup-sdk.cmake)

project(rv_env C)

set(CMAKE_C_STANDARD 11)

add_executable(rv_env_sandbox main.c)