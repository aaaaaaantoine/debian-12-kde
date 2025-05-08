#!/bin/bash

# Script à exécuter après l'installation de Debian depuis l'image ISO Netinstall avec le bureau KDE Plasma
# Commentez les sections qui ne vous intéressent pas.
# Pour l'utiliser vous aurez besoin de sudo et que votre utilisateur soit dans ce groupe.

echo "--------------------------------"
echo "Script de Debian à usage général"
echo "--------------------------------"

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
calligra-gemini \
calligraplan \
calligrasheets \
calligrastage \
calligrawords \
dolphin \
dragonplayer \
elisa \
falkon \
gwenview \
kaddressbook \
karbon \
kcalc \
kdepim-addons \
kdenlive \
kdeconnect \
kde-spectacle \
kid3 \
kmail \
konsole \
kontact \
konversation \
korganizer \
krita \
ksystemlog \
ktorrent \
kwalletmanager \
kwave \
kwrite \
okular \
partitionmanager \
plasma-firewall \
plasma-vault \
yakuake

# Installation de Kodi Media Center
sudo apt install kodi -y

# Utilitaires en ligne de commande
sudo apt install -y\
bash-completion \
ufw \
vim \
wget

# Installation du script Youtube-dl depuis le dépôt Backpors
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

echo "Le script post-installation est terminé, veuillez redémarrer le système"
