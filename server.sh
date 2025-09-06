#!/bin/bash
#==================================================
# Script de post-installation Debian - Serveur
#--------------------------------------------------
# Automatise l'installation et la configuration
# d'un serveur Debian minimal avec Cockpit.
# Compatible Debian 12/13 (Bookworm / Trixie)
#==================================================

set -euo pipefail

# --- Couleurs ---
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
NC="\e[0m"

# --- Vérification root ---
if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}ERREUR : Ce script doit être exécuté en tant que root (sudo).${NC}" >&2
    exit 1
fi

echo -e "${BLUE}--- Démarrage du script d'installation et de configuration ---${NC}"

# --- Mise à jour du système ---
echo -e "${BLUE}Mise à jour et mise à niveau du système...${NC}"
apt update -y && apt full-upgrade -y

# --- Vérification connexion internet ---
if ! ping -c 1 deb.debian.org &>/dev/null; then
    echo -e "${RED}ERREUR : Pas de connexion Internet. Vérifiez le réseau.${NC}" >&2
    exit 1
fi

# --- Paquets à installer ---
PACKAGES=(
    cockpit
    cockpit-machines
    cockpit-packagekit
    cockpit-pcp
    cockpit-podman
    curl
    fail2ban
    spice-html5
    rsync
    firewalld
)

echo -e "${BLUE}Installation des utilitaires de base...${NC}"
apt install -y "${PACKAGES[@]}"

# --- Activation des services ---
echo -e "${BLUE}Activation et démarrage des services...${NC}"
systemctl enable --now cockpit.socket
systemctl enable --now firewalld

# --- Pare-feu ---
echo -e "${BLUE}Configuration du pare-feu...${NC}"
if command -v firewall-cmd >/dev/null 2>&1; then
    firewall-cmd --add-port=9090/tcp --permanent
    firewall-cmd --reload
else
    echo -e "${YELLOW}Attention : firewalld n'est pas disponible.${NC}"
fi

# --- Ajout de l’utilisateur courant au groupe libvirt ---
CURRENT_USER=$(logname 2>/dev/null || echo "${SUDO_USER:-$USER}")

if id "$CURRENT_USER" &>/dev/null; then
    echo -e "${BLUE}Ajout de l'utilisateur ${CURRENT_USER} au groupe libvirt...${NC}"
    usermod -a -G libvirt "$CURRENT_USER"
else
    echo -e "${YELLOW}Utilisateur courant introuvable, étape ignorée.${NC}"
fi

# --- Nettoyage ---
echo -e "${BLUE}Nettoyage des paquets inutiles...${NC}"
apt autoremove -y && apt clean

# --- Résumé ---
echo -e "${BLUE}--------------------------------------------------------${NC}"
echo -e "${GREEN}Installation terminée avec succès.${NC}"
echo -e "${YELLOW}Accès Cockpit : https://$(hostname -I | awk '{print $1}'):9090${NC}"
echo -e "${YELLOW}Un redémarrage est recommandé pour finaliser la configuration.${NC}"
echo -e "${BLUE}--------------------------------------------------------${NC}"
