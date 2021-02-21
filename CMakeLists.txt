cmake_minimum_required(VERSION 3.19)

# Modify this for your project
set(APP_NAME "stm32f4_template")

project(${APP_NAME} C ASM)


# the name of the target operating system
set(CMAKE_SYSTEM_NAME      Generic)
set(CMAKE_SYSTEM_VERSION   1)
set(CMAKE_SYSTEM_PROCESSOR ARM)

# Specify GNU toolchain
set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_ASM_COMPILER arm-none-eabi-gcc)
set(CMAKE_OBJCOPY arm-none-eabi-objcopy)
set(CMAKE_OBJDUMP arm-none-eabi-objdump)

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# ARM flags
set(CORE_FLAGS "-mthumb -mcpu=cortex-m4 -mlittle-endian -mfpu=fpv4-sp-d16 -mfloat-abi=hard --specs=nano.specs --specs=nosys.specs")

set(CMAKE_C_FLAGS "${CORE_FLAGS} -fno-builtin -Wall -std=gnu99 -fdata-sections -ffunction-sections -g3 -gdwarf-2" CACHE INTERNAL "c compiler flags")

set(CMAKE_ASM_FLAGS "${CORE_FLAGS} -g -ggdb3" CACHE INTERNAL "asm compiler flags")

# search for programs in the build host directories
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# for libraries and headers in the target directories
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# Modify the device for the model you're using
set(DEVICE STM32F411xE)

# Set it to the value of the crystal you're using
set(HSE_VALUE 8000000)

# You might need to adjust the memory regions as needed
get_filename_component(LINKER_SCRIPT linker.ld ABSOLUTE)

# This is where HAL is build into a library
add_subdirectory(Lib)

# This is where your project source files are build
add_subdirectory(Src)

