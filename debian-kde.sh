#!/bin/bash
## Lancer le script:
## $ debian-kde.sh
## Script d'installation personnalisé de Debian 12 Bookworm avec KDE Plasma

## Backports
sudo echo "deb http://deb.debian.org/debian $(lsb_release -cs)-backports main contrib non-free-firmware" | tee -a /etc/sudo apt/sources.list
sudo echo "deb-src http://deb.debian.org/debian $(lsb_release -cs)-backports main contrib non-free-firmware" | tee -a /etc/sudo apt/sources.list

## MAJ
sudo apt update && sudo apt full-upgrade -y

## KDE Minimal
sudo apt install kde-plasma-desktop -y

## KDE Applications
sudo apt install akregator ark calligra calligra-gemini calligraplan calligrasheets calligrastage calligrawords dolphin dragonplayer elisa falkon gwenview kaddressbook karbon kcalc kdepim-addons kdenlive kdeconnect kid3 kmail konsole kontact konversation korganizer krita ksystemlog ktorrent kwalletmanager kwave kwrite okular partitionmanager plasma-firewall plasma-vault print-manager kde-spectacle yakuake -y

## Kodi Media Center
sudo apt install kodi -y

## CLI
sudo apt install bash-completion ufw vim wget -y
sudo apt install yt-dlp -t bookworm-backports -y

## VirtualBox
sudo apt install fasttrack-archive-keyring -y
sudo echo "deb http://fasttrack.debian.net/debian-fasttrack/ $(lsb_release -cs)-fasttrack main contrib" | sudo tee /etc/apt/sources.list.d/fasttrack.list
sudo echo "deb http://fasttrack.debian.net/debian-fasttrack/ $(lsb_release -cs)-backports-staging main contrib" | sudo tee -a /etc/apt/sources.list.d/fasttrack.list
sudo apt update
sudo apt install virtualbox -y
sudo gpasswd -a antoine vboxusers
#sudo apt install virtualbox-ext-pack -y
#sudo sudo apt install virtualbox-guest-utils -y
