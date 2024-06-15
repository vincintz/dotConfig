#!/usr/bin/env bash

echo "=========================================
      Run system update/upgrade
      =========================================" | xargs
sudo apt update && sudo apt upgrade -y

echo "=========================================
    Instal apt
    =========================================" | xargs
sudo apt install -y alacritty
sudo apt install -y flatpak
sudo apt install -y gnome-shell-extensions gnome-shell-extension-manager gnome-shell-extension-prefs gnome-tweaks
sudo apt install -y cheese

echo "=========================================
    Instal flatpaks
    =========================================" | xargs
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub net.waterfox.waterfox
flatpak install -y com.brave.Browser

echo "=========================================
    Instal uLauncher
    =========================================" | xargs
sudo add-apt-repository universe -y && sudo add-apt-repository ppa:agornostal/ulauncher -y && sudo apt update && sudo apt install -y ulauncher
