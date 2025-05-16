#!/bin/bash

systemInstall() {
	sudo pacman -S --noconfirm $@
}

systemInstallNew() {
	for pkg in "$@"
	do
		if [[ -z $(pacman -Q | grep "$pkg") ]]; then
			systemInstall $pkg
		fi
	done
}
