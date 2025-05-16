#!/bin/bash

systemInstallNew cronie
sudo systemctl enable --now cronie.service
