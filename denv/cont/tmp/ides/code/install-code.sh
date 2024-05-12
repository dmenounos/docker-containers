#!/bin/bash

set -e
source "install.in"

ARCHURL="https://az764295.vo.msecnd.net/stable/e5a624b788d92b8d34d1392e4c4d9789406efe8f/code-stable-x64-1605051992.tar.gz"
HASHURL="https://code.visualstudio.com/download"

ARCHIVE="code-stable-x64-1605051992.tar.gz"
ARCHDIR="VSCode-linux-x64"

HOMEDIR="code-2020-11"
HOMELNK="code"

HOMEVAR="CODE_HOME"
HOMEBIN=""

main "$@"
