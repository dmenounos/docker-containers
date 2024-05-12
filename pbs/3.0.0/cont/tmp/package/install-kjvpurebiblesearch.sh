#!/bin/bash

set -e
source "./install.in"

PACK_URL="https://cloud.dewtronics.com/KingJamesPureBibleSearch/kjvpurebiblesearch-3.0.0-2.x86_64.run"
PACK_FILE=$(get_file_name "$PACK_URL")

do_download() {
	download_archive "$PACK_URL" "$PACK_FILE" "package file"
}

do_verify() {
	do_download

	verify_archive "$PACK_FILE"
}

do_install() {
	do_verify

	if [ ! "$USER" == "root" ]; then
		error "Aborting: $0 is not run as root"
		exit 1
	fi

	apt install -y alien
	# apt install -y libsm6 libxext6 libxrender1

	chmod +x "$PACK_FILE"
	"./$PACK_FILE"
}

main "$@"
