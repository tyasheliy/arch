#!/bin/bash

systemInstallNew openresolv openvpn
sudo sh -c 'curl -L "https://raw.githubusercontent.com/alfredopalhares/openvpn-update-resolv-conf/refs/heads/master/update-resolv-conf.sh" > /etc/openvpn/update-resolv-conf'
sudo chmod +x /etc/openvpn/update-resolv-conf
