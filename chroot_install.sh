#!/bin/bash

if [[ -z $TARGET_USER ]]; then
	echo "No target user specified. Put target username in TARGET_USER."
	exit 1
fi

pacman -S --noconfirm vim networkmanager git firefox pacman-contrib
systemctl enable NetworkManager.service

sudoersFilename="install_nix_for_${TARGET_USER}"
sudoersFileAbs=/etc/sudoers.d/$sudoersFilename
echo "${TARGET_USER} ALL=(ALL:ALL) NOPASSWD: ALL" >> $sudoersFileAbs

su $TARGET_USER -c "sh <(curl -L https://nixos.org/nix/install) --daemon --yes"
su $TARGET_USER -c "git clone https://github.com/tyasheliy/arch ~/os"
su $TARGET_USER -c "bash ~/os/install.sh"

rm -f $sudoersFileAbs
