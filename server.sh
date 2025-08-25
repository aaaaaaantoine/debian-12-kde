#!/bin/bash

#==================================================
# Script de post-installation Debian - Serveur
#--------------------------------------------------
# Automatise l'installation et la configuration
# d'un serveur Debian minimal avec Cockpit.
#==================================================

# Règle d'or : le script s'arrête si une commande échoue
set -e

# Vérification des privilèges root
if [[ $EUID -ne 0 ]]; then
    echo -e "\e[31mERREUR : Ce script doit être exécuté en tant que root. Veuillez utiliser 'sudo'.\e[0m" >&2
    exit 1
fi

echo -e "\e[34m--- Démarrage du script d'installation et de configuration ---\e[0m"

# --- Mise à jour du système ---
echo -e "\e[34mMise à jour et mise à niveau du système...\e[0m"
apt update && apt full-upgrade -y

# --- Installation des utilitaires et services ---
echo -e "\e[34mInstallation des utilitaires de base...\e[0m"
apt install -y \
  cockpit \
  cockpit-machines \
  cockpit-packagekit \
  cockpit-pcp \
  cockpit-podman \
  curl \
  fail2ban \
  spice-html5 \
  rsync \
  firewalld

# --- Configuration des services ---
echo -e "\e[34mActivation et démarrage des services...\e[0m"
systemctl enable --now cockpit.socket
systemctl enable --now firewalld

# --- Configuration du pare-feu ---
echo -e "\e[34mConfiguration du pare-feu pour le service Cockpit...\e[0m"
firewall-cmd --add-port=9090/tcp --permanent
firewall-cmd --reload

# --- Gestion des utilisateurs ---
echo -e "\e[34mAjout de l'utilisateur courant au groupe libvirt...\e[0m"
# On utilise 'logname' pour obtenir le nom de l'utilisateur qui a lancé la session.
usermod -a -G libvirt $USER

echo -e "\e[34m--------------------------------------------------------\e[0m"
echo -e "\e[34mLe script de post-installation est terminé.\e[0m"
echo -e "\e[34mUn redémarrage est nécessaire pour que les modifications prennent effet.\e[0m"
echo -e "\e[34m--------------------------------------------------------\e[0m"
exit 0
