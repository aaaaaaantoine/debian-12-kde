#!/bin/bash

# Script à exécuter après l'installation de Debian depuis l'image ISO Netinstall avec le bureau KDE Plasma
# Commentez les sections qui ne vous intéressent pas.
# Pour l'utiliser vous aurez besoin de sudo et que votre utilisateur soit dans ce groupe.

echo "--------------------------------"
echo "Script de Debian à usage général"
echo "--------------------------------"

# Utilitaires que je supprime
sudo apt autoremove -y \
gimp* \
juk \
kfind \
kmag \
kmousetool \
kmouth \
konqueror \
libreoffice* \
sweeper \
xterm

# Ajout du dépôt Backports
echo "deb http://deb.debian.org/debian bookworm-backports main contrib non-free-firmware" | tee -a /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian bookworm-backports main contrib non-free-firmware" | tee -a /etc/apt/sources.list

# Ajout du dépôt VirtualBox
sudo apt install fasttrack-archive-keyring -y
sudo echo "deb http://fasttrack.debian.net/debian-fasttrack/ bookworm-fasttrack main contrib" | sudo tee /etc/apt/sources.list.d/fasttrack.list
sudo echo "deb http://fasttrack.debian.net/debian-fasttrack/ bookworm-backports-staging main contrib" | sudo tee -a /etc/apt/sources.list.d/fasttrack.list

# Mise à jour du système 
sudo apt update
sudo apt full-upgrade -y

# Installation mes utilitaires pour KDE Plasma 
sudo apt install -y \
calligra \
calligra-gemini \
calligraplan \
calligrasheets \
calligrastage \
calligrawords \
elisa \
kdepim-addons \
kdenlive \
kid3 \
kontact \
konversation \
krita \
ksystemlog \
ktorrent \
kwalletmanager \
kwave \
plasma-firewall \
yakuake

# Installation de Kodi Media Center
sudo apt install kodi -y

# Utilitaires en ligne de commande
sudo apt install -y \
ufw \
vim

# Installation du script Youtube-dl depuis le dépôt Backpors
sudo apt install yt-dlp -t bookworm-backports -y

# Installation de VirtualBox
sudo apt install virtualbox virtualbox-ext-pack -y
sudo gpasswd -a antoine vboxusers

echo "Le script post-installation est terminé, veuillez redémarrer le système"
