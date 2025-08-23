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
cockpit-machines \
cockpit-packagekit \
cockpit-pcp \
cockpit-podman \
curl \
rsync

# Services
sudo systemctl enable --now cockpit.socket

### Pare-feu
sudo apt install -y firewalld
sudo systemctl enable --now firewalld
sudo firewall-cmd --add-port=9090/tcp --permanent
sudo firewall-cmd --reload

# libvirt USER Mode
sudo usermod -aG libvirt $USER

echo "Le script post-installation est terminé, veuillez redémarrer le système"
exit 0
