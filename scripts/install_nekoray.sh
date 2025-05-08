#!/bin/bash

set -e 

mkdir -p $HOME/.local/share/applications

sudo apt install build-essential \
                 libfontconfig1 \
                 libqt5network5 \
                 libqt5widgets5 \
                 libqt5x11extras5 \
                 libqt5gui5 \
				 unzip

wget -qO- https://raw.githubusercontent.com/ohmydevops/nekoray-installer/main/installer.sh | bash

cfgDir=$HOME/.config/nekoray/config


set +e
mkdir -p $cfgDir
set -e

ln -s $cfgDir $HOME/NekoRay/nekoray/config

sudo sh -c "echo 'tyasheliy ALL=(ALL:ALL) NOPASSWD: /home/tyasheliy/NekoRay/nekoray/launcher' >> /etc/sudoers"
sudo /home/tyasheliy/NekoRay/nekoray/launcher
