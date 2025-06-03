#!/bin/bash

# Script à exécuter après l'installation de Debian depuis l'image ISO Minimal Netinstall
# Commentez les sections qui ne vous intéressent pas.
# Pour l'utiliser vous aurez besoin de sudo et que votre utilisateur soit dans ce groupe.

echo "--------------------------------"
echo "Script de Debian à usage général"
echo "--------------------------------"

sudo mv /etc/apt/sources.list /etc/apt/sources.list.save

# Dépôts trixie
sudo echo "deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware" | sudo tee /etc/apt/sources.list
sudo echo "deb-src http://deb.debian.org/debian trixie main contrib non-free non-free-firmware" | sudo tee -a /etc/apt/sources.list
sudo echo "deb http://deb.debian.org/debian trixie-updates main contrib non-free non-free-firmware" | sudo tee -a /etc/apt/sources.list
sudo echo "deb-src http://deb.debian.org/debian trixie-updates main contrib non-free non-free-firmware" | sudo tee -a /etc/apt/sources.list
sudo echo "deb http://security.debian.org/debian-security/ trixie-security main contrib non-free non-free-firmware" | sudo tee -a /etc/apt/sources.list
sudo echo "deb-src http://security.debian.org/debian-security/ trixie-security main contrib non-free non-free-firmware" | sudo tee -a /etc/apt/sources.list
sudo echo "deb http://deb.debian.org/debian trixie-backports main contrib non-free non-free-firmware" | sudo tee -a /etc/apt/sources.list
sudo echo "deb-src http://deb.debian.org/debian trixie-backports main contrib non-free non-free-firmware" | sudo tee -a /etc/apt/sources.list

# Mise à jour du système 
sudo apt update
sudo apt full-upgrade -y

# Installation de Flatpak
sudo apt install -y flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

sudo apt modernize-sources

# Installation mes utilitaires pour GNOME
sudo apt install -y \
abiword \
alacarte \
celluloid \
curl \
deja-dup \
epiphany-browser \
geary \
gnome-builder \
gnome-calendar \
gnome-console \
gnome-core \
gnome-music \
gnome-software-plugin-flatpak \
gnucash \
gnumeric \
git \
kodi \
secrets \
shortwave \
ufw \
vim

# Installation mes utilitaires Flatpak pour GNOME
sudo flatpak install -y flathub app.drey.EarTag
#sudo flatpak install -y flathub io.github.diegoivan.pdf_metadata_editor
sudo flatpak install -y flathub io.gitlab.news_flash.NewsFlash
sudo flatpak install -y flathub org.gnome.Podcasts

# Installation du script Youtube-dl depuis le dépôt Backports
sudo apt install -y yt-dlp # -t stable-backports

# Utilitaires que je supprime
sudo apt autoremove -y \
evince \
gnome-characters \
gnome-font-viewer \
gnome-logs \
gnome-snapshot \
simple-scan \
totem

echo "Le script post-installation est terminé, veuillez redémarrer le système"
