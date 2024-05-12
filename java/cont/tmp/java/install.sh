#!/bin/bash

set -e
source "../install.in"

ARCHURL="https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz"

ARCHIVE="openjdk-11.0.2_linux-x64_bin.tar.gz"
ARCHDIR="jdk-11.0.2"

HOMEDIR="jdk-11.0.2"
HOMELNK="jdk"

HOMEVAR="JAVA_HOME"
HOMEBIN="/bin"

main "$@"
