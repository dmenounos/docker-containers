#!/bin/bash

set -e
source "./install.in"

ARCHURL="https://cloud.dewtronics.com/KingJamesPureBibleSearch/KJPBS-v3.0-portable-Linux-64bit.zip"

ARCHIVE="KJPBS-v3.0-portable-Linux-64bit.zip"
ARCHDIR="KJPBS-v3.0-Linux-64bit"

HOMEDIR="KJPBS-v3.0"
HOMELNK="KJPBS"

HOMEVAR="KJPBS_HOME"
HOMEBIN=""

main "$@"
