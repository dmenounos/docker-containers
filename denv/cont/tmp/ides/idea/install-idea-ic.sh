#!/bin/bash

set -e
source "install.in"

ARCHURL="https://download.jetbrains.com/idea/ideaIC-2022.1.3.tar.gz"
HASHURL="https://download.jetbrains.com/idea/ideaIC-2022.1.3.tar.gz.sha256"

ARCHIVE="ideaIC-2022.1.3.tar.gz"
ARCHDIR="idea-IC-221.5921.22"

HOMEDIR="idea-ic-2022.1.3"
HOMELNK="idea-ic"

HOMEVAR="IDEA_IC_HOME"
HOMEBIN=""

main "$@"

if [ "$USER" == "root" ]; then
	apt install -y libswt-gtk-4-jni
fi
