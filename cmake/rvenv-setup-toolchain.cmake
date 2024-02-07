if (DEFINED RVENV_TOOLCHAIN)
	if (RVENV_TOOLCHAIN STREQUAL "host")
		# Don't need to load a toolchain file for host. Just use CMake default values.
	else()
		set(RVENV_TOOLCHAIN_DIR ${RVENV_PATH}/cmake/toolchain)
		set(RVENV_TOOLCHAIN_FILE ${RVENV_TOOLCHAIN_DIR}/${RVENV_TOOLCHAIN}.cmake)

		if (EXISTS "${RVENV_TOOLCHAIN_FILE}")
			# TODO: Check for existing toolchain cache entry?
			set(CMAKE_TOOLCHAIN_FILE "${RVENV_TOOLCHAIN_FILE}" CACHE INTERNAL "")
		else ()
			message(FATAL_ERROR "Could not find toolchain file '${RVENV_TOOLCHAIN_FILE}'! Did RVENV_TOOLCHAIN get set correctly?")
		endif ()

	endif ()

	message("RVENV toolchain is ${RVENV_TOOLCHAIN}")
else ()
	message(FATAL_ERROR "No RVENV_TOOLCHAIN specified! Was the platform setup correctly?")
endif ()

