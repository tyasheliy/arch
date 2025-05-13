#!/bin/bash

# Setups btrfs snapshots with snapper.
#
# Very risky script. Use with caution.
# If on config create snapper gives `subvolume already covered`,
# check output of `snapper list-configs`, if there is root config,
# delete it with `snapper -c root delete-config`. Then try again and
# if then snapper gives you `config already exists` delete `/etc/snapper/configs/root`,
# delete existing configs var in `/etc/conf.d/snapper` (see: https://github.com/openSUSE/snapper/issues/421#issuecomment-997485840).

set -e

if ! command -v /usr/bin/btrfs; then
	echo "not using btrfs"
	exit 1
fi

echo "This is very risky script."
echo "If something goes wrong, check comments in source code of this script for troubleshoot."
echo "Press enter to execute script (Ctrl+c to cancel): "
read

# archinstall scripts installs .snapshots subvolume, need to delete it
if [[ ! -z $(sudo btrfs subv list / | grep ".snapshots") ]]; then
	if [[ -d /.snapshots ]]; then
		sudo umount /.snapshots
		sudo rm -r /.snapshots
	fi

	sudo mount /dev/mapper/root -o subvolid=5 /mnt
	sudo btrfs subv delete /mnt/@.snapshots
	sudo umount /mnt
fi

sudo pacman -S --noconfirm snapper arch-install-scripts
sudo snapper -c root create-config /

sudo btrfs subv delete /.snapshots
sudo mount /dev/mapper/root -o subvolid=5 /mnt
sudo btrfs subv create /mnt/@.snapshots
sudo umount /mnt

sudo mkdir /.snapshots
sudo mount -o subvol=/@.snapshots /dev/mapper/root /.snapshots
sudo snapper -c root create --description init
sudo genfstab / > /etc/fstab

sudo pacman -S --noconfirm snap-pac
