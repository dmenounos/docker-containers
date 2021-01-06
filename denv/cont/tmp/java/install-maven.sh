#!/bin/bash

set -e
source "../install.in"

ARCHURL="https://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz"

ARCHIVE="apache-maven-3.3.9-bin.tar.gz"
ARCHDIR="apache-maven-3.3.9"

HOMEDIR="maven-3.3.9"
HOMELNK="maven"

HOMEVAR="MAVEN_HOME"
HOMEBIN="/bin"

main "$@"
