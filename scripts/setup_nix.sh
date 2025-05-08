#!/bin/bash

set +e

mkdir -p $HOME/.config/nix
rm $HOME/.config/nix/nix.conf
ln -s $(realpath ./source/nix.conf) $HOME/.config/nix/nix.conf
