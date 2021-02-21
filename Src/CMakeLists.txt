# List all sources.
# You will need to add the source file 
# as you add them to your project
set(SOURCES 
	main.c 
	system_stm32f4xx.c
	startup_stm32f411xe.s
)

set(ELF_FILE ${PROJECT_NAME}.elf)
set(MAP_FILE ${PROJECT_NAME}.map)

add_executable(${ELF_FILE} ${SOURCES})

# Link HAL library to the project
target_link_libraries(${ELF_FILE} PUBLIC libhal)

# Add more flags as needed
set(COMPILER_FLAGS 
	-Os 
)

set(LINKER_FLAGS 
	-Wl,-Map=../${MAP_FILE} 
	-g
	-Wl,--gc-sections
)

target_compile_options(${ELF_FILE} PRIVATE ${COMPILER_FLAGS})
target_link_libraries(${ELF_FILE} PRIVATE ${LINKER_FLAGS})

# Link it according to our custom linker file
target_link_libraries(${ELF_FILE} PUBLIC -T${LINKER_SCRIPT})
