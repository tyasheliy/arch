#!/bin/bash

sudo echo "Using sudo!"

systemInstallNew ly

sudo systemctl disable getty@tty2.service
sudo systemctl enable ly.service
