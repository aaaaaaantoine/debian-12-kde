#!/bin/bash
## Script d'installation personnalisé de Debian 12 Bookworm avec KDE Plasma

## Backports
echo "deb http://deb.debian.org/debian bookworm-backports main contrib non-free-firmware" | tee -a /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian bookworm-backports main contrib non-free-firmware" | tee -a /etc/apt/sources.list

## MAJ
apt update && apt full-upgrade -y

## KDE Minimal
apt install kde-plasma-desktop -y

## KDE Applications
apt install akregator ark calligra calligra-gemini calligraplan calligrasheets calligrastage calligrawords dolphin dragonplayer elisa falkon gwenview kaccounts-integration kaccounts-providers kaddressbook karbon kcalc kdepim-addons kdenlive kdeconnect kde-spectacle kid3 kmail konsole kontact konversation korganizer krita ksystemlog ktorrent kwalletmanager kwave kwrite okular partitionmanager plasma-bigscreen plasma-discover-backend-flatpak plasma-firewall plasma-vault plasma-wallpapers-addons plasma-workspace-wallpapers print-manager yakuake -y

## Kodi Media Center
apt install kodi -y

## CLI
apt install bash-completion vim wget -y
apt install yt-dlp -t bookworm-backports -y

## VirtualBox
apt install fasttrack-archive-keyring -y
echo "deb http://fasttrack.debian.net/debian-fasttrack/ bookworm-fasttrack main contrib" | sudo tee /etc/apt/sources.list.d/fasttrack.list
echo "deb http://fasttrack.debian.net/debian-fasttrack/ bookworm-backports-staging main contrib" | sudo tee -a /etc/apt/sources.list.d/fasttrack.list
apt update
apt install virtualbox -y
gpasswd -a antoine vboxusers
#apt install virtualbox-ext-pack -y
#apt install virtualbox-guest-utils -y
