#!/bin/bash
sudo apt purge plymouth-theme*
sudo sed -i '/GRUB_CMDLINE_LINUX_DEFAULT/c\GRUB_CMDLINE_LINUX_DEFAULT=""' /etc/default/grub
sudo update-grub
