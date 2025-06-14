#!/bin/bash

systemInstall() {
	sudo pacman -S --noconfirm $@
}

systemInstallNew() {
	for pkg in "$@"
	do
		pacman -Qi "${pkg}" > /dev/null
		if [[ $? -eq 1 ]]; then
			systemInstall $pkg
		fi
	done
}
