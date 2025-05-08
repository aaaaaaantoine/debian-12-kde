#!/bin/bash

# Script post-installation d'une Debian 12 Bookworm avec l'environnement KDE Plasma

echo "-------------------------------"
echo "Ce script"
echo "-------------------------------"

# Ajout du dépôt Backports
echo "deb http://deb.debian.org/debian bookworm-backports main contrib non-free-firmware" | tee -a /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian bookworm-backports main contrib non-free-firmware" | tee -a /etc/apt/sources.list

# Mise à jour du système 
sudo apt update
sudo apt full-upgrade -y

# Installation mes utilitaires pour KDE Plasma 
sudo apt install -y \
akregator \
ark \
calligra \
calligra-gemini calligraplan calligrasheets calligrastage calligrawords dolphin dragonplayer elisa gwenview kaccounts-integration kaccounts-providers kaddressbook karbon kcalc kdepim-addons kdenlive kdeconnect kde-spectacle kid3 kmail konqueror konsole kontact konversation korganizer krita ksystemlog ktorrent kwalletmanager kwave kwrite okular partitionmanager plasma-bigscreen plasma-discover-backend-flatpak plasma-firewall plasma-vault plasma-wallpapers-addons plasma-workspace-wallpapers print-manager yakuake -y

# Installation de Kodi Media Center
sudo apt install kodi -y

# Utilitaires en ligne de commande
sudo apt install bash-completion vim wget -y
sudo apt install yt-dlp -t bookworm-backports -y

# Installation de VirtualBox
sudo apt install fasttrack-archive-keyring -y
sudo echo "deb http://fasttrack.debian.net/debian-fasttrack/ bookworm-fasttrack main contrib" | sudo tee /etc/apt/sources.list.d/fasttrack.list
sudo echo "deb http://fasttrack.debian.net/debian-fasttrack/ bookworm-backports-staging main contrib" | sudo tee -a /etc/apt/sources.list.d/fasttrack.list
sudoapt update
sudo apt install virtualbox -y
sudo gpasswd -a antoine vboxusers
#sudo apt install virtualbox-ext-pack -y
#sudo apt install virtualbox-guest-utils -y
