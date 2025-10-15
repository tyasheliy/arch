#!/bin/bash

sudo echo "Using sudo!"

systemInstallNew docker docker-compose buildkit docker-buildx
sudo usermod -aG docker tyasheliy
sudo systemctl enable --now docker.socket
