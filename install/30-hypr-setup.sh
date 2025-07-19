#!/usr/bin/env bash
set -e
###############################################################################
# Author	:	Kelly McCuddy
###############################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
#   This script is a work in progress.  The goal of which to get a fresh Arch
#   install setup with the xorg window server so that any WM or DE can be 
#   installed. The package choice is fory my persoal taste. You will need to 
#   edit the package choices for your prefences.
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
# Enable multilib repository for 32-bit libraries
if ! grep -q "^\[multilib\]" /etc/pacman.conf; then
    sudo sed -i '/^#\[multilib\]/,/^#Include/ s/^#//' /etc/pacman.conf
fi
sudo pacman -Sy
###############################################################################
echo "Installation of the core software"
###############################################################################

list=(
awesome-terminal-fonts 
ttf-font-awesome
ttf-dejavu 
ttf-liberation
polkit
polkit-gnome
pipewire
pipewire-alsa
pipewire-pulse
lib32-pipewire
wireplumber
pamixer
pavucontrol
gstreamer
gst-plugins-good
gst-plugins-bad
gst-plugins-base
gst-plugins-ugly
playerctl
volumeicon
uwsm
fastfetch
wl-clip-persist
dolphin
ffmpegthumbnailer
mpv
evince
imv
hyprland
hyprshot
hyprpicker
hyprlock
hypridle
hyprland-qtutils
wofi
waybar
mako
swaybg
xdg-desktop-portal-hyprland
xdg-desktop-portal-gtk
)

count=0


for name in "${list[@]}" ; do
	count=$[count+1]
	tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
	func_install $name
done

### Get current username and setup up autologin for hyprland
### Hyprland launched via UWSM and login directly as user, rely on disk encryption + hyprlock for security

current_user=$(id -u -n)

#sudo systemctl enable uwsm@$current_user.service

mkdir -p ~/.config/uwsm
cat <<EOF > ~/.config/uwsm/config.toml
[general]
autologin = true
user = $current_user
session = "Hyprland"

[sessions]
Hyprland = "/usr/bin/Hyprland"
EOF

if [ -f "/usr/share/wayland-sessions/hyprland.desktop" ]; then
    echo "File exists, nothing to do."
else
    sudo cat <<EOF > /usr/share/wayland-sessions/hyprland.desktop
[Desktop Entry]
Name=Hyprland
Exec=Hyprland
Type=Application
DesktopNames=Hyprland
EOF
fi

###############################################################################

tput setaf 7;echo "################################################################"
echo "You now have a functional xserver awaiting a Window Manager"
echo "################################################################"
echo;tput sgr0

tput setaf 11;
echo "################################################################"
echo "Reboot your system"
echo "################################################################"
echo;tput sgr0
