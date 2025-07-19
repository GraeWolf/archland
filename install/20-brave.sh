#!/usr/bin/env bash

tput setaf 7;echo "################################################################"
echo "Installing Aur Helper Pikaur"
echo "################################################################"
echo;tput sgr0

sudo pacman -S --noconfirm --needed base-devel

if ! command -v pikaur &>/dev/null; then
    cd /tmp
    git clone https://aur.archlinux.org/pikaur.git
    cd pikaur
    makepkg -fsri
    cd -
    rm -rf pikaur
    cd ~
fi

tput setaf 7;echo "################################################################"
echo "Installation of Pikaur complete"
echo "################################################################"
echo;tput sgr0

tput setaf 7;echo "################################################################"
echo "Installing Brave Browser"
echo "################################################################"
echo;tput sgr0
pikaur -S --noconfirm --needed brave-bin

tput setaf 7;echo "################################################################"
echo "Installation of Brave complete"
echo "################################################################"
echo;tput sgr0
