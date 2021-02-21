# Stm32 HAL project template
The template is based on CMake and currently only supports F4 family of STM32.
It generates the compile_commands.json file in the project root 
to be picked up by the CCLS if you're using one.

# Usage
You need to have CMake on your system.

Clone the repo.

Edit the CMLists.txt in the project root to specify the device used.

Run the build script:
'''
./build.sh
'''
