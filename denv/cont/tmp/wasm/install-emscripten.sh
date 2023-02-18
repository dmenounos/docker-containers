#!/bin/bash

set -e
source "../install.in"

# -----------------------------------------------------------------------------
# Semi-Custom installation procedure
# -----------------------------------------------------------------------------

USER=$(whoami)

if [ "$USER" != "root" ]; then
	echo "Usage: $0 must be run as root" 1>&2
	exit 1
fi

DEST="/opt"

# -----------------------------------------------------------------------------
# https://emscripten.org/docs/getting_started/downloads.html
# -----------------------------------------------------------------------------

# Install Python
apt-get -y install python3

# Install CMake (optional, only needed for tests and building Binaryen or LLVM)
apt-get -y install cmake

cd "$DEST"

# Get the emsdk repo
git clone https://github.com/emscripten-core/emsdk.git

# Enter that directory
cd emsdk

# Fetch the latest version of the emsdk (not needed the first time you clone)
git pull

# Download and install the latest SDK tools.
./emsdk install 2.0.9

# Make the "latest" SDK "active" for the current user. (writes .emscripten file)
./emsdk activate 2.0.9

# -----------------------------------------------------------------------------

HOMELNK="emsdk"
HOMEVAR="EMSDK_HOME"
HOMEBIN="/upstream/emscripten"
VERBOSE="2"

# Setup environment variables
add_environment_variable "$DEST" "$HOMELNK" "$HOMEVAR" "$HOMEBIN"
