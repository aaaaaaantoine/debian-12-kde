#!/bin/bash

#==================================================
# Script de post-installation Debian - Usage général
#--------------------------------------------------
# Exécuté sur Debian Netinstall Minimal.
# Ce script doit être lancé avec les privilèges root.
#==================================================

# Règle d'or : arrêter le script si une commande échoue
set -e

# Vérification des privilèges root
if [[ $EUID -ne 0 ]]; then
    echo "ERREUR : Ce script doit être exécuté en tant que root. Veuillez utiliser sudo." >&2
    exit 1
fi

echo "--- Démarrage du script d'installation et de configuration ---"

# --- Mise à jour du système ---
echo "Mise à jour et mise à niveau du système..."
apt update && apt full-upgrade -y

# --- Installation des utilitaires et services ---
echo "Installation des utilitaires de base..."
apt install -y \
  cockpit \
  cockpit-machines \
  cockpit-packagekit \
  cockpit-pcp \
  cockpit-podman \
  curl \
  spice-html5 \
  rsync \
  firewalld

# --- Configuration des services ---
echo "Activation et démarrage des services..."
systemctl enable --now cockpit.socket
systemctl enable --now firewalld

# --- Configuration du pare-feu ---
echo "Configuration du pare-feu pour le service Cockpit..."
firewall-cmd --add-port=9090/tcp --permanent
firewall-cmd --reload

# --- Gestion des utilisateurs ---
echo "Ajout de l'utilisateur courant au groupe libvirt..."
# On utilise 'logname' pour obtenir le nom de l'utilisateur qui a lancé la session.
usermod -a -G libvirt $USER

echo "--------------------------------------------------------"
echo "Le script de post-installation est terminé."
echo "Un redémarrage est nécessaire pour que les modifications prennent effet."
echo "--------------------------------------------------------"
exit 0
