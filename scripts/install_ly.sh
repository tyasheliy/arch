#!/bin/bash

sudo snap install zig --classic --beta
sudo apt install -y build-essential libpam0g-dev libxcb-xkb-dev

git clone https://codeberg.org/AnErrupTion/ly ly_source

(cd ly_source && zig build && sudo zig build installexe)

sudo systemctl disable lightdm.service
sudo systemctl enable ly.service

sudo apt purge -y libpam0g-dev libxcb-xkb-dev
sudo snap remove zig
sudo rm -rf ly_source
