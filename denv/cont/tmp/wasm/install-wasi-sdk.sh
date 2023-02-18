#!/bin/bash

set -e
source "../install.in"

ARCHURL="https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-12/wasi-sdk-12.0-linux.tar.gz"

ARCHIVE="wasi-sdk-12.0-linux.tar.gz"
ARCHDIR="wasi-sdk-12.0"

HOMEDIR="wasi-sdk-12.0"
HOMELNK="wasi-sdk"

HOMEVAR="WASI_SDK_HOME"
HOMEBIN="/bin"

main "$@"
