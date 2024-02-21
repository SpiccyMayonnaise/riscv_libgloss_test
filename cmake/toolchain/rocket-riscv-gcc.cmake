# With inspiration from https://github.com/five-embeddev/riscv-scratchpad/blob/master/cmake/cmake/riscv.cmake

# Locate RISC-V 64-bit embedded GCC
find_file(RISCV_SYSTEM_GCC_COMPILER "riscv64-unknown-elf-gcc")
# TODO: Maybe look for the Windows .exe too?

# TODO: If there are multiple options, select one
if(EXISTS ${RISCV_SYSTEM_GCC_COMPILER})
set(RISCV_GCC_COMPILER ${RISCV_SYSTEM_GCC_COMPILER})
else()
	message(FATAL_ERROR "Could not find RISC-V 64-bit embedded GCC.")
endif()

message("Found RISC-V 64-bit embedded GCC: ${RISCV_GCC_COMPILER}")

# Decompose the gcc path
get_filename_component(RISCV_TOOLCHAIN_BIN_PATH ${RISCV_GCC_COMPILER} DIRECTORY)
get_filename_component(RISCV_TOOLCHAIN_BIN_GCC ${RISCV_GCC_COMPILER} NAME_WE)
get_filename_component(RISCV_TOOLCHAIN_BIN_EXT ${RISCV_GCC_COMPILER} EXT)

message("RISC-V gcc path: ${RISCV_TOOLCHAIN_BIN_PATH}")

# Get the prefix, eg riscv64-unknown-elf-
STRING(REGEX REPLACE "\-gcc" "-" TOOL_PREFIX ${RISCV_TOOLCHAIN_BIN_GCC})
message( "RISC-V tool prefix: ${TOOL_PREFIX}" )

# The Generic system name is used for embedded targets (targets without OS) in
# CMake
set(CMAKE_SYSTEM_NAME           Generic)
set(CMAKE_SYSTEM_PROCESSOR      rv64imafdc)
set(CMAKE_C_COMPILER_ABI        lp64d)
set(CMAKE_EXECUTABLE_SUFFIX     ".elf")

# Specify the compilers to use
set(CMAKE_C_COMPILER ${TOOL_PREFIX}gcc)
set(CMAKE_ASM_COMPILER ${TOOL_PREFIX}gcc)
set(CMAKE_AR ${TOOL_PREFIX}ar)

# Set flags
set(CMAKE_C_FLAGS "-fno-common -fno-builtin-printf -specs=htif_nano.specs -Wall")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -march=${CMAKE_SYSTEM_PROCESSOR} -mabi=${CMAKE_C_COMPILER_ABI}")

set(CMAKE_EXE_LINKER_FLAGS "-march=${CMAKE_SYSTEM_PROCESSOR} -mabi=${CMAKE_C_COMPILER_ABI}")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static")

set(CMAKE_EXECUTABLE_SUFFIX_C ".riscv")

add_compile_definitions(RV)

# Get libgloss_htif
