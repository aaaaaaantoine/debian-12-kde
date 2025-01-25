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
sudo apt install akregator ark calligra calligra-gemini calligraplan calligrasheets calligrastage calligrawords dolphin dragonplayer elisa falkon gwenview kaddressbook karbon kcalc kdepim-addons kdenlive kdeconnect kid3 kmail konsole kontact konversation korganizer krita ksystemlog ktorrent kwalletmanager kwave kwrite okular plasma-vault partitionmanager kde-spectacle yakuake -y

## Kodi Media Center
sudo apt install kodi -y

## CLI
sudo apt install yt-dlp -t bookworm-backports -y

## VirtualBox
wget https://www.virtualbox.org/download/oracle_vbox_2016.asc
sudo gpg --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg --dearmor oracle_vbox_2016.asc
sudo echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" > /etc/apt/sources.list.d/virtualbox.list
sudo apt update && sudo apt full-upgrade -y
sudo apt install virtualbox-7.1 -y
sudo gpasswd -a antoine vboxusers
wget https://download.virtualbox.org/virtualbox/$vboxver/Oracle_VM_VirtualBox_Extension_Pack-$vboxver.vbox-extpack
sudo VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-$vboxver.vbox-extpack
#sudo sudo apt install virtualbox-guest-utils -y
