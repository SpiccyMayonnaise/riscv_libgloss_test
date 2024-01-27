if (NOT RVENV_TARGET_PLATFORM)
	# Default platform is host
	set(RVENV_TARGET_PLATFORM host)

	message("Defaulted to host platform")
else()
	message("Target platform is ${RVENV_TARGET_PLATFORM}")
endif()

set(RVENV_TARGET_PLATFORM ${RVENV_TARGET_PLATFORM} CACHE STRING "The target platform to build for. (host)")

set(RVENV_PLATFORM_DIR ${CMAKE_CURRENT_LIST_DIR}/platforms)
set(RVENV_PLATFORM_FILE ${RVENV_PLATFORM_DIR}/${RVENV_TARGET_PLATFORM}.cmake)

if (NOT EXISTS "${RVENV_PLATFORM_FILE}")
	message(FATAL_ERROR "Platform file does not exist for '${RVENV_TARGET_PLATFORM}'! (${RVENV_PLATFORM_FILE}) Is RVENV_TARGET_PLATFORM valid?")
endif()

# Include the file. The platform file should setup any dependencies and set the RVENV_TOOLCHAIN variable
include(${RVENV_PLATFORM_FILE})