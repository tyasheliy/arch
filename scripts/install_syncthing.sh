#!/bin/bash

systemInstallNew syncthing
systemctl --user enable --now syncthing.service
