#!/bin/bash

if [[ -z $TARGET_USER ]]; then
	echo "No target user specified. Put target username in TARGET_USER."
	exit 1
fi

pacman -S --noconfirm vim networkmanager git firefox pacman-contrib
systemctl enable NetworkManager.service

su $TARGET_USER -c "sh <(curl -L https://nixos.org/nix/install) --daemon"
