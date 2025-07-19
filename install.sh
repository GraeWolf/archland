#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# Give people a chance to retry running the installation
trap 'echo "archland installation failed! You can retry by running: source install.sh"' ERR

# Install everything
for f in install/*.sh; do
  echo -e "\nRunning installer: $f"
  source "$f"
done
sudo pacman -S --noconfirm --needed gum
# Ensure locate is up to date now that everything has been installed
sudo updatedb

gum confirm "Reboot to apply all settings?" && reboot
