#!/bin/bash

set -e
source "../install.in"

ARCHURL="https://nodejs.org/dist/v12.20.0/node-v12.20.0-linux-x64.tar.xz"

ARCHIVE="node-v12.20.0-linux-x64.tar.xz"
ARCHDIR="node-v12.20.0-linux-x64"

HOMEDIR="node-12.20.0"
HOMELNK="node"

HOMEVAR="NODE_HOME"
HOMEBIN="/bin"

main "$@"
