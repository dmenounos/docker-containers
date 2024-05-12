#!/bin/bash

set -e
source "../install.in"

ARCHURL="https://javadl.oracle.com/webapps/download/AutoDL?BundleId=239835_230deb18db3e4014bb8e3e8324f81b43"

ARCHIVE="jdk-8u221-linux-x64.tar.gz"
ARCHDIR="jdk1.8.0_221"

HOMEDIR="jdk-1.8.0_221"
HOMELNK="jdk"

HOMEVAR="JAVA_HOME"
HOMEBIN="/bin"

main "$@"
