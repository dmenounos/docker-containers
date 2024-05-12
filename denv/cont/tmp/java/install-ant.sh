#!/bin/bash

set -e
source "../install.in"

ARCHURL="https://archive.apache.org/dist/ant/binaries/apache-ant-1.9.2-bin.tar.gz"

ARCHIVE="apache-ant-1.9.2-bin.tar.gz"
ARCHDIR="apache-ant-1.9.2"

HOMEDIR="ant-1.9.2"
HOMELNK="ant"

HOMEVAR="ANT_HOME"
HOMEBIN="/bin"

main "$@"
