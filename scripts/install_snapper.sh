#!/bin/bash

# Setup script for btrfs snapshots with snapper.
#
# This is a very risky script. Use with caution.
# If on config create snapper gives `subvolume already covered`,
# check output of `snapper list-configs`. If there is a config for root subvol,
# delete it with `snapper -c root delete-config`, then try again.
# If snapper gives you `config already exists`, then delete `/etc/snapper/configs/root` and
# delete existing configs var in `/etc/conf.d/snapper` (see: https://github.com/openSUSE/snapper/issues/421#issuecomment-997485840).

set -e

if ! command -v /usr/bin/btrfs; then
	echo "not using btrfs"
	exit 1
fi

echo "This is a very risky script."
echo "If something goes wrong, check the comments in the source code of this script for troubleshooting."
echo "Press enter to execute script (Ctrl+c to cancel): "
read

# archinstall installs .snapshots subvol, should delete it
if [[ ! -z $(sudo btrfs subv list / | grep ".snapshots") ]]; then
	if [[ -d /.snapshots ]]; then
		sudo umount /.snapshots
		sudo rm -r /.snapshots
	fi

	sudo mount /dev/mapper/root -o subvolid=5 /mnt
	sudo btrfs subv delete /mnt/@.snapshots
	sudo umount /mnt
fi

systemInstallNew snapper arch-install-scripts
sudo snapper -c root create-config /

sudo btrfs subv delete /.snapshots
sudo mount /dev/mapper/root -o subvolid=5 /mnt
sudo btrfs subv create /mnt/@.snapshots
sudo umount /mnt

sudo mkdir /.snapshots
sudo mount -o subvol=/@.snapshots /dev/mapper/root /.snapshots
sudo snapper -c root create --description init
sudo sh -c "genfstab / > /etc/fstab"

systemInstallNew snap-pac
sudo systemctl enable --now snapper-cleanup.timer
