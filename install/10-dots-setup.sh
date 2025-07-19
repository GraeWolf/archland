#!/usr/bin/env bash
#set -e
###############################################################################
# Author	:	Kelly McCuddy
###############################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#   
#   This a script to automate the retrieval of my dotfiles.
#
###############################################################################


echo ".archland-dots" >> .gitignore
git clone --bare https://github.com/GraeWolf/archland-dots.git $HOME/.archland-dots
git --git-dir=$HOME/.archland-dots/ --work-tree=$HOME checkout
git --git-dir=$HOME/.archland-dots/ --work-tree=$HOME config --local status.showUntrackedFiles no

