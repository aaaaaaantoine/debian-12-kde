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

# Rsync
sudo apt install -y rsync

# Libvirt Qemu/KVM
sudo apt install -y libvirt-daemon
sudo systemctl enable --now libvirtd
sudo usermod -aG libvirt $USER

### UFW
sudo apt install -y ufw
sudo ufw allow ssh
sudo ufw enable

echo "Le script post-installation est terminé, veuillez redémarrer le système"
exit 0
