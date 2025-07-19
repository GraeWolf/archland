#!/usr/bin/env bash
set -e

tput setaf 7;echo "################################################################"
echo "Installing printing system"
echo "################################################################"
echo;tput sgr0

sudo pacman -S --noconfirm cups cups-pdf cups-filters system-config-printer
sudo systemctl enable --now cups.service

tput setaf 7;echo "################################################################"
echo "Printing system installation complete"
echo "################################################################"
echo;tput sgr0
