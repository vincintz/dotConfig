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
sudo apt install -y gnome-shell-extensions gnome-shell-extension-prefs gnome-tweaks
sudo apt install -y cheese

echo "=========================================
    Instal flatpaks
    =========================================" | xargs
flatpak install -y flathub net.waterfox.waterfox
flatpak install -y com.brave.Browser
