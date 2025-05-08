#!/bin/bash
ls ~/neovim || git clone https://github.com/neovim/neovim ~/neovim
(cd ~/neovim && git checkout stable && make)
sudo rm /usr/bin/nvim
sudo mv ~/neovim/build/bin/nvim /usr/bin/nvim