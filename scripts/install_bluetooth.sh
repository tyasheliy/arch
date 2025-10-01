#!/bin/bash

systemInstallNew bluez bluez-utils blueman pulseaudio-bluetooth pulseaudio-alsa
sudo usermod -aG tyasheliy lp
sudo systemctl enable --now bluetooth.service
