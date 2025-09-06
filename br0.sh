#!/bin/bash
#==================================================
# Script de création et configuration du pont réseau br0
#--------------------------------------------------
# Compatible Debian 12/13 (Bookworm / Trixie)
# Automatise l’installation et configuration de systemd-networkd
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

echo -e "${BLUE}--- Démarrage du script de configuration du pont réseau br0 ---${NC}"

# --- Détection automatique de l'interface ---
DEFAULT_IFACE=$(ip route get 8.8.8.8 2>/dev/null | awk '{print $5; exit}')
echo -e "${YELLOW}Interface détectée par défaut : ${DEFAULT_IFACE}${NC}"

# --- Entrées utilisateur avec valeur par défaut ---
read -p "Nom de l’interface physique [${DEFAULT_IFACE}] : " PHYSICAL_INTERFACE
PHYSICAL_INTERFACE=${PHYSICAL_INTERFACE:-$DEFAULT_IFACE}

read -p "Adresse IP statique pour br0 (ex. 192.168.0.10/24) : " BRIDGE_IP
read -p "Passerelle (ex. 192.168.0.1) : " GATEWAY_IP
read -p "Serveur DNS (ex. 1.1.1.1 ou 192.168.0.1) : " DNS_IP

# --- Vérification basique des entrées ---
if [[ -z "$BRIDGE_IP" || -z "$GATEWAY_IP" || -z "$DNS_IP" ]]; then
    echo -e "${RED}ERREUR : Tous les champs doivent être remplis.${NC}" >&2
    exit 1
fi

# --- Sauvegarde des fichiers existants ---
BACKUP_DIR="/etc/systemd/network/backup_$(date +%F_%H-%M-%S)"
mkdir -p "$BACKUP_DIR"
cp /etc/systemd/network/*.network /etc/systemd/network/*.netdev "$BACKUP_DIR" 2>/dev/null || true
echo -e "${GREEN}Sauvegarde effectuée dans $BACKUP_DIR${NC}"

# --- Création de la config ---
cat << EOF > /etc/systemd/network/10-br0.netdev
[NetDev]
Name=br0
Kind=bridge
EOF

cat << EOF > /etc/systemd/network/10-br0.network
[Match]
Name=br0

[Network]
Address=$BRIDGE_IP
Gateway=$GATEWAY_IP
DNS=$DNS_IP
EOF

cat << EOF > /etc/systemd/network/20-$PHYSICAL_INTERFACE.network
[Match]
Name=$PHYSICAL_INTERFACE

[Network]
Bridge=br0
EOF

# --- Services ---
echo -e "${BLUE}Activation de systemd-networkd...${NC}"
systemctl enable --now systemd-networkd

if systemctl is-active --quiet NetworkManager; then
    echo -e "${YELLOW}Désactivation de NetworkManager...${NC}"
    systemctl disable --now NetworkManager
fi

# --- Application ---
echo -e "${BLUE}Application des changements...${NC}"
networkctl reload
sleep 2

echo -e "${BLUE}--------------------------------------------------------${NC}"
echo -e "${GREEN}Configuration terminée.${NC}"
echo -e "${BLUE}État actuel du réseau :${NC}"
networkctl list
echo -e "${BLUE}--------------------------------------------------------${NC}"
