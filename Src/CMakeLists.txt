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

# Show .elf size after build
add_custom_command(TARGET ${ELF_FILE} POST_BUILD COMMAND arm-none-eabi-size ${ELF_FILE})

# Create openocd.cfg file
set(OPENOCD_CONFIG
	"source [find interface/${OPENOCD_INTERFACE}.cfg]\n\
	source [find target/${OPENOCD_TARGET}.cfg]"
)

file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/openocd.cfg" "${OPENOCD_CONFIG}")

# Connect 
add_custom_target(connect DEPENDS ${ELF_FILE} COMMAND openocd)

# Flash the binary
add_custom_target(flash DEPENDS ${ELF_FILE} COMMAND openocd --command "program ${ELF_FILE} reset exit")


set(GDB_CONFIG_FILE "config.gdb")
# Create GDB config file
set(GDB_CONFIG
"file ${ELF_FILE}\n\
target remote :3333\n\

set print asm-demangle on\n\
set print pretty on\n\
load\n\
break main\n\
continue\n\
"
)
# Connect debugger
file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/${GDB_CONFIG_FILE}" "${GDB_CONFIG}")

# Connect 
add_custom_target(debug DEPENDS ${ELF_FILE} COMMAND arm-none-eabi-gdb -x ${GDB_CONFIG_FILE})
