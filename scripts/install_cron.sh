#!/bin/bash
sudo pacman -S --noconfirm cronie
sudo systemctl enable --now cronie.service
