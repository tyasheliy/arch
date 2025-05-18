#!/bin/bash

systemInstallNew docker docker-compose
sudo usermod -aG docker tyasheliy
sudo systemctl enable --now docker.socket
