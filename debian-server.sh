#!/bin/bash

# Script à exécuter après l'installation de Debian depuis l'image ISO Netinstall sans interface graphique.
# Commentez les sections qui ne vous intéressent pas.
# Pour l'utiliser vous aurez besoin de sudo et que votre utilisateur soit dans ce groupe.

echo "--------------------------------"
echo "Script de Debian à usage général"
echo "--------------------------------"

# Mise à jour du système 
sudo apt update
sudo apt full-upgrade -y

# Mes utilitaires
sudo apt install -y \
btrfs-progs \
lvm2 \
mdadm \
nfs-kernel-server \
openssh-server \
samba \
rsync \
ufw \
vim \
xfsprogs

# Cockpit WebUI
sudo apt install -y cockpit
sudo systemctl enable --now cockpit.socket

echo "Le script post-installation est terminé, veuillez redémarrer le système"
