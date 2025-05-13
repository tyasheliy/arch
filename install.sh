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

#git clone https://github.com/tyasheliy/xubuntu $HOME/os

cfgDir=$(realpath $HOME/os)
export SCRIPT_DIR="${cfgDir}/scripts"

rn setup_nix.sh
replaceDefaultUser $cfgDir/flake.nix
replaceDefaultUser $cfgDir/config.nix
rn install_home-manager.sh
hsw
