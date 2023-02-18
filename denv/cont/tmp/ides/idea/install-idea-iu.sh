#!/bin/bash

set -e
source "install.in"

ARCHURL="https://download.jetbrains.com/idea/ideaIU-2022.1.4.tar.gz"
HASHURL="https://download.jetbrains.com/idea/ideaIU-2022.1.4.tar.gz.sha256"

ARCHIVE="ideaIU-2022.1.4.tar.gz"
ARCHDIR="idea-IU-221.6008.13"

HOMEDIR="idea-iu-2022.1.4"
HOMELNK="idea-iu"

HOMEVAR="IDEA_IU_HOME"
HOMEBIN=""

main "$@"

if [ "$USER" == "root" ]; then
	apt install -y libswt-gtk-4-jni
fi
