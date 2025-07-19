#!/usr/bin/env bash
set -e
###############################################################################
# Author	:	Kelly McCuddy
###############################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
#
###############################################################################


###############################################################################
#
#   DECLARATION OF FUNCTIONS
#
###############################################################################


func_install() {
	if pacman -Qi $1 &> /dev/null; then
		tput setaf 2
  		echo "###############################################################################"
  		echo "################## The package "$1" is already installed"
      	echo "###############################################################################"
      	echo
		tput sgr0
	else
    	tput setaf 3
    	echo "###############################################################################"
    	echo "##################  Installing package "  $1
    	echo "###############################################################################"
    	echo
    	tput sgr0
    	sudo pacman -S --noconfirm --needed $1
    fi
}

###############################################################################
echo "Installation of the termial and shell"
###############################################################################

list=(
wget
curl
unzip
inetutils
fd
eza
fzf
ripgrep
bat
wl-clipboard
btop
man
tldr
less
whois
plocate
zsh
zsh-completions
ghostty
)

count=0

for name in "${list[@]}" ; do
	count=$[count+1]
	tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
	func_install $name
done

echo "Setting the shell to zsh"
chsh -s /bin/zsh

tput setaf 7;echo "################################################################"
echo "Terminal and shell is now setup"
echo "################################################################"
echo;tput sgr0

