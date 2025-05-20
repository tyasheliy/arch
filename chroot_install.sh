#!/bin/bash

pacman -S --noconfirm vim networkmanager git
systemctl enable NetworkManager.service

if [[ -z $TARGET_USER ]]; then
	echo "No target username provided. Exiting."
	exit 0
fi

if [[ -z $TARGET_USER_HOME ]]; then
	TARGET_USER_HOME=/home/$TARGET_USER
	echo "No custom user home provided. Using ${TARGET_USER_HOME}"
fi

mkdir /nix
chown -R $TARGET_USER /nix

osDir=$TARGET_USER_HOME/os

if [[ ! -d $osDir ]]; then
	git clone https://github.com/tyasheliy/arch $osDir
	chown -R $TARGET_USER $osDir
fi

sudoersStr="${TARGET_USER} ALL=(ALL:ALL) NOPASSWD: ALL" 
echo $sudoersStr >> /etc/sudoers

su $TARGET_USER -c "bash ${osDir}/install.sh"

sed -i "s/${sudoersStr}//g" /etc/sudoers

chsh -s $(which zsh) $TARGET_USER
