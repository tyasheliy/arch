#!/bin/bash

systemInstallNew throttled
sudo systemctl enable --now throttled.service
