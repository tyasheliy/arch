#!/bin/bash
command -v zsh | sudo tee -a /etc/shells
chsh -s $(command -v zsh)
