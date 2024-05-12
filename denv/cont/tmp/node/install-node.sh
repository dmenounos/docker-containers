#!/bin/bash

set -e
source "../install.in"

ARCHURL="https://nodejs.org/dist/v10.23.0/node-v10.23.0-linux-x64.tar.xz"

ARCHIVE="node-v10.23.0-linux-x64.tar.xz"
ARCHDIR="node-v10.23.0-linux-x64"

HOMEDIR="node-10.23.0"
HOMELNK="node"

HOMEVAR="NODE_HOME"
HOMEBIN="/bin"

main "$@"
