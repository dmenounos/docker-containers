#!/bin/bash

set -e
source "../install.in"

ARCHURL="https://nodejs.org/dist/v14.15.3/node-v14.15.3-linux-x64.tar.xz"

ARCHIVE="node-v14.15.3-linux-x64.tar.xz"
ARCHDIR="node-v14.15.3-linux-x64"

HOMEDIR="node-14.15.3"
HOMELNK="node"

HOMEVAR="NODE_HOME"
HOMEBIN="/bin"

main "$@"
