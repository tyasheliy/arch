#!/bin/bash

systemInstallNew syncthing
sudo systemctl enable --now syncthing@$(whoami).service
