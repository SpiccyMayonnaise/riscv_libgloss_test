# Must be included in root CMakeLists.txt before the project() call
# Meant to be included from an external project to setup rvenv

# TODO: add a dummy target to prevent including twice?

if (NOT RVENV_PATH)
	set(RVENV_PATH ${CMAKE_CURRENT_LIST_DIR})
endif ()

message("RVENV_PATH is ${RVENV_PATH}")

include(${RVENV_PATH}/cmake/rvenv-setup-platform.cmake)

include(${RVENV_PATH}/cmake/rvenv-setup-toolchain.cmake)
