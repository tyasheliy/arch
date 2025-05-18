#!/bin/bash

set -e

if [[ -z $EDITOR ]]; then
	echo "No editor specified. Put it in EDITOR"
	exit 1
fi

read -p "Enter repository: " repo

tmpDir=/tmp/aur_$(date +%s)
mkdir -p $tmpDir
git clone $repo $tmpDir

if [[ ! -f $tmpDir/PKGBUILD ]]; then
	echo "No PKGBUILD found"
	sudo rm -rf $tmpDir
	exit 1
fi

$EDITOR $tmpDir/PKGBUILD
echo "To install package press enter (Ctrl-c to cancel):" && read

cd $tmpDir
makepkg -si
