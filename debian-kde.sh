#!/bin/bash
# À LANCER EN ROOT
# Script d'installation personnalisé de Debian 12 Bookworm avec KDE Plasma

## Backports
echo "deb http://deb.debian.org/debian bookworm-backports main contrib non-free-firmware" | tee -a /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian bookworm-backports main contrib non-free-firmware" | tee -a /etc/apt/sources.list

## MAJ
apt update && apt full-upgrade -y

## KDE Minimal
apt install kde-plasma-desktop -y

## KDE Applications
apt install akregator ark calligra calligra-gemini calligraplan calligrasheets calligrastage calligrawords dolphin dragonplayer elisa falkon gwenview kaddressbook karbon kcalc kdepim-addons kdenlive kdeconnect kid3 kmail konsole kontact konversation korganizer krita ksystemlog ktorrent kwalletmanager kwave kwrite okular plasma-vault partitionmanager kde-spectacle yakuake -y

## Kodi Media Center
apt install kodi -y

## CLI
apt install yt-dlp -t bookworm-backports -y

## VirtualBox
wget https://www.virtualbox.org/download/oracle_vbox_2016.asc
gpg --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg --dearmor oracle_vbox_2016.asc
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" > /etc/apt/sources.list.d/virtualbox.list
apt update && apt full-upgrade -y
apt install virtualbox-7.1 -y
gpasswd -a antoine vboxusers
wget https://download.virtualbox.org/virtualbox/$vboxver/Oracle_VM_VirtualBox_Extension_Pack-$vboxver.vbox-extpack
VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-$vboxver.vbox-extpack
#apt install virtualbox-guest-utils -y
