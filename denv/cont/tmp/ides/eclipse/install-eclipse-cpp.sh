#!/bin/bash

set -e
source "install.in"

ARCHURL="https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2020-09/R/eclipse-cpp-2020-09-R-linux-gtk-x86_64.tar.gz"
HASHURL="http://download.eclipse.org/technology/epp/downloads/release/2020-09/R/eclipse-cpp-2020-09-R-linux-gtk-x86_64.tar.gz.md5"

ARCHIVE="eclipse-cpp-2020-09-R-linux-gtk-x86_64.tar.gz"
ARCHDIR="eclipse"

HOMEDIR="eclipse-cpp-2020-09"
HOMELNK="eclipse-cpp"

HOMEVAR="ECLIPSE_CPP_HOME"
HOMEBIN=""

main "$@"

if [ "$USER" == "root" ]; then
	apt install -y libswt-gtk-4-jni
fi
