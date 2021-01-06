#!/bin/bash

set -e
source "../install.in"

ARCHURL="https://github.com/bytecodealliance/wasmtime/releases/download/v0.21.0/wasmtime-v0.21.0-x86_64-linux.tar.xz"

ARCHIVE="wasmtime-v0.21.0-x86_64-linux.tar.xz"
ARCHDIR="wasmtime-v0.21.0-x86_64-linux"

HOMEDIR="wasmtime-0.21.0"
HOMELNK="wasmtime"

HOMEVAR="WASMTIME_HOME"
HOMEBIN=""

main "$@"
