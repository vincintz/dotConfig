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
sudo apt install -y flatpak
sudo apt install -y gnome-software-plugin-flatpak
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub net.waterfox.waterfox
flatpak install -y com.brave.Browser
flatpak install -y org.ferdium.Ferdium

echo "=========================================
      Download fonts
      =========================================" | xargs
FONTS_PATH=$HOME/.fonts
FONTS_LIST="Hack JetBrainsMono ComicShannsMono"

mkdir "$FONTS_PATH"

cd "$FONTS_PATH" || (echo -e "Invalid path to script\n"; exit)
for FONT in $FONTS_LIST; do
    curl -OL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$FONT.tar.xz"
    tar xf "$FONT.tar.xz" --wildcards "*.?tf"
    rm "$FONT.tar.xz"
done


echo "=========================================
      Map config
      =========================================" | xargs
ln -s "$HOME/dotConfig/alacritty/.config/alacritty" "$HOME/.config"
