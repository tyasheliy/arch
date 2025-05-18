#!/bin/bash

systemInstallNew bluez bluez-utils blueman
sudo usermod -aG tyasheliy lp
sudo systemctl enable --now bluetooth.service

