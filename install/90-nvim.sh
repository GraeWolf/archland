#!/usr/bin/env bash


tput setaf 7;echo "################################################################"
echo "Setting up LazyVim neovim distribution"
echo "################################################################"
echo;tput sgr0

if ! command -v nvim &>/dev/null; then
    sudo pacman -S --noconfirm --needed neovim luarocks tree-sitter-cli

    # install LazyVim
    rm -rf ~/.config/nvim
    git clone https://github.com/LazyVim/starter ~/.config/nvim/
    rm -rf ~/.config/nvim/.git
fi

tput setaf 7;echo "################################################################"
echo "Lazyvim is now installed and ready to go."
echo "################################################################"
echo;tput sgr0
