set(CMAKE_TOOLCHAIN_FILE toolchain/rocketchip-riscv-gcc.cmake)

#include(ExternalProject)
#
#find_program(MAKE_EXE NAMES gmake nmake make)
#ExternalProject_Add(libgloss
#		PREFIX          ${CMAKE_SOURCE_DIR}/toolchain/libgloss
#
#		GIT_REPOSITORY  git@github.com:ucb-bar/libgloss-htif.git
#		GIT_PROGRESS    true
#
#		CONFIGURE_COMMAND "configure --prefix=${TOOL_PREFIX} --host=riscv64-unknown-elf"
#
#		BUILD_COMMAND   ${MAKE_EXE}
#)
#
#execute_process(
#		COMMAND ${CMAKE_COMMAND} ${CMAKE_SOURCE_DIR}/toolchain/libgloss
#
#)