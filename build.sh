#!/bin/bash

BUILD_DIR="out"
CC_JSON="compile_commands.json"

# Prepare output directory
if [ -d "$BUILD_DIR" ]; then
	rm -rf ./out/*
else
	mkdir "$BUILD_DIR"
fi

cd $BUILD_DIR

# Start the build and create compile-commands file
cmake -S ../ -DCMAKE_EXPORT_COMPILE_COMMANDS=YES
make

cd ..

# Create the symlink to the compile-commands.json in the project root
# so that ccls can pick it up
if ! [ -L "$CC_JSON" ] ; then
	echo "Creating symlink to compile_commands.json"
	ln -s "$BUILD_DIR/compile_commands.json" .
fi
