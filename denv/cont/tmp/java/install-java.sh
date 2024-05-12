#!/bin/bash

set -e
source "../install.in"

ARCHURL="https://download.java.net/java/GA/jdk17.0.2/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-17.0.2_linux-x64_bin.tar.gz"

ARCHIVE="openjdk-17.0.2_linux-x64_bin.tar.gz"
ARCHDIR="jdk-17.0.2"

HOMEDIR="jdk-17.0.2"
HOMELNK="jdk"

HOMEVAR="JAVA_HOME"
HOMEBIN="/bin"

main "$@"