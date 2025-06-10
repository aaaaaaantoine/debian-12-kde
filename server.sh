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
cockpit \
cockpit-bridge \
cockpit-machines \
cockpit-packagekit \
cockpit-pcp \
cockpit-podman \
cockpit-sosreport \
cockpit-system \
curl \
btrfs-progs \
firewalld \
kexec-tools \
lvm2 \
mdadm \
nfs-common \
nfs-kernel-server \
openssh-server \
samba \
rsync \
ufw \
vim \
xfsprogs

# Services
sudo systemctl enable --now cockpit.socket

echo "Le script post-installation est terminé, veuillez redémarrer le système"
