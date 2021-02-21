# Stm32 HAL project template
The template is based on CMake and currently only supports F4 family of STM32.
It generates the compile_commands.json file in the project root 
to be picked up by the CCLS if you're using one.

# Usage
You need to have CMake on your system.

Clone the repo.

Edit the CMakeLists.txt in the project root to specify the device used.

Adjust the linker file content if needed. Sections should be ok for most chips
however the FLASH and SRAM values will need adjustment.

Copy the correct startup file from the startup directory into the Src directory. 

Run the build script:

``` bash
./build.sh
```

The script will run CMake and create the link to the compile_commands.json
file in the project root. This file is helpful when using the CCLS. 
