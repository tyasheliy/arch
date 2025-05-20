#!/bin/bash

set -e

systemInstallNew pacman-contrib

countries=(
	"RU"
	"BY"
	"UA"
)

countryParam=""

for country in ${countries[*]}; do
	countryParam="${countryParam}&country=${country}"
done

list="/etc/pacman.d/mirrorlist"
bak="${list}.bak"

if [[ -f $bak ]]; then
	sudo rm $bak
fi

sudo cp $list $bak

url="https://archlinux.org/mirrorlist/?protocol=https&use_mirror_status=on${countryParam}"
s=$(curl -s $url)
s=$(echo "${s}" | sed -e 's/^#Server/Server/' -e '/^#/d')

sudo sh -c "echo '${s}' | rankmirrors -n 5 - > ${list}"
