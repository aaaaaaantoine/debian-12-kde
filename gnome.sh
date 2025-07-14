#!/bin/bash

# Script à exécuter après l'installation de Debian depuis l'image ISO Minimal Netinstall
# Commentez les sections qui ne vous intéressent pas.
# Pour l'utiliser vous aurez besoin de sudo et que votre utilisateur soit dans ce groupe.

echo "--------------------------------"
echo "Script de Debian à usage général"
echo "--------------------------------"

# Mise à jour du système 
sudo apt update
sudo apt full-upgrade -y

# Installation de Flatpak
sudo apt install -y flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

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

# Virtualisation Qemu/KVM
sudo apt install -y virt-manager
sudo usermod -a -G libvirt $USER
sudo systemctl enable --now libvirtd

# Installation mes utilitaires Flatpak pour GNOME
sudo flatpak install -y flathub app.drey.EarTag
sudo flatpak install -y flathub io.gitlab.news_flash.NewsFlash
sudo flatpak install -y flathub org.gnome.Podcasts

# Installation du script Youtube-dl
sudo apt install -y yt-dlp

# Utilitaires que je supprime
sudo apt autoremove -y \
evince \
gnome-characters \
gnome-font-viewer \
gnome-logs \
gnome-maps \
gnome-snapshot \
shotwell \
simple-scan \
totem

echo "Le script post-installation est terminé, veuillez redémarrer le système"
exit 0
