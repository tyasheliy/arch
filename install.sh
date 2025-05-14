#!/bin/bash

set -eEuo pipefail

if [[ "${EUID}" = 0 ]]; then
	echo "Won't run it as root."
	exit 1
fi

if [[ -z "${USER}" ]]; then
	exit 1
fi

if [[ -z "${HOME}" ]]; then
	exit 1
fi

rn() {
	bash $cfgDir/rn.sh $1
}

hsw() {
	export NIXPKGS_ALLOW_UNFREE=1 && home-manager switch --flake $cfgDir
}

replaceDefaultUser() {
	sed -i "s/tyasheliy/${USER}/g" $1
}

sh <(curl -L https://nixos.org/nix/install) --no-daemon --yes

nixsh=$HOME/.nix-profile/etc/profile.d/nix.sh
source $nixsh

if [[ ! -d $HOME/os ]]; then
	git clone https://github.com/tyasheliy/arch $HOME/os
fi

cfgDir=$(realpath $HOME/os)
export SCRIPT_DIR="${cfgDir}/scripts"

rn setup_nix.sh
replaceDefaultUser $cfgDir/flake.nix
replaceDefaultUser $cfgDir/config.nix
rn install_home-manager.sh
hsw
