#!/bin/bash

# Script à exécuter après l'installation de Debian depuis l'image ISO Minimal Netinstall
# Commentez les sections qui ne vous intéressent pas.
# Pour l'utiliser vous aurez besoin de sudo et que votre utilisateur soit dans ce groupe.

echo "--------------------------------"
echo "Script de Debian à usage général"
echo "--------------------------------"

## Upgrade 
sudo apt update
sudo apt full-upgrade -y

## Flatpak
# sudo apt install -y flatpak
# sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Bureau KDE Plasma
sudo apt install -y \
akregator \
ark \
calligra \
dolphin \
dragonplayer \
elisa \
falkon \
gwenview \
kaccounts-integration \
kaccounts-providers \
kaddressbook \
kate \
kcalc \
kdenlive \
kdevelop \
kdevelop-l10n \
kexi \
kde-plasma-desktop \
kdepim-addons \
kmail \
kodi \
korganizer \
konsole \
kontact \
konversation \
krdc \
krita \
ktorrent \
okular \
partitionmanager \
plasma-firewall \
sddm \
vim \
virt-manager \
yakuake

# Virtualisation Qemu/KVM
sudo apt install -y virt-manager
sudo usermod -aG libvirt $USER
sudo systemctl enable --now libvirtd

# Installation de Youtube-dl
sudo apt install -y yt-dlp

echo "Le script post-installation est terminé, veuillez redémarrer le système"
exit 0
