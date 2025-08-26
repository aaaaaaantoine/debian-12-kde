#!/bin/bash

#==================================================
# Script de création du pont réseau br0
#--------------------------------------------------
# Automatise l'installation et la configuration
# du pont réseau br0 pour Debian 13 Trixie
#==================================================

# Règle d'or : le script s'arrête si une commande échoue
set -e

# Vérification des privilèges root
if [[ $EUID -ne 0 ]]; then
    echo -e "\e[31mERREUR : Ce script doit être exécuté en tant que root. Veuillez utiliser 'sudo'.\e[0m" >&2
    exit 1
fi

echo -e "\e[34m--- Démarrage du script de création du pont réseau br0 ---\e[0m"

# --- Détecte automatiquement l'interface physique utilisée ---
PHYSICAL_INTERFACE=$(ip route get 8.8.8.8 | awk '{print $5}')
echo "Interface physique détectée : $PHYSICAL_INTERFACE"

# --- Demande des informations à l'utilisateur ---
echo -e "\e[33mEntrez le nom de l'interface physique (ex. eno1, enp1s0) :\e[0m"
read PHYSICAL_INTERFACE
echo -e "\e[33mEntrez l'adresse IP statique du pont br0 (ex. 192.168.0.10/24) :\e[0m"
read BRIDGE_IP
echo -e "\e[33mEntrez l'adresse de la passerelle (ex. 192.168.0.1) :\e[0m"
read GATEWAY_IP
echo -e "\e[33mEntrez l'adresse du serveur DNS (ex. 192.168.0.1) :\e[0m"
read DNS_IP

# --- Création du pont réseau ---
echo -e "\e[34mCréation de la configuration pour le pont br0...\e[0m"
cat << EOF > /etc/systemd/network/10-br0.netdev
[NetDev]
Name=br0
Kind=bridge
EOF

# --- Configuration de l'IP du pont br0 ---
cat << EOF > /etc/systemd/network/10-br0.network
[Match]
Name=br0

[Network]
Address=$BRIDGE_IP
Gateway=$GATEWAY_IP
DNS=$DNS_IP
EOF

# --- Configuration de l'interface physique ---
echo -e "\e[34mConnexion de l'interface physique $PHYSICAL_INTERFACE au pont...\e[0m"
cat << EOF > /etc/systemd/network/20-$PHYSICAL_INTERFACE.network
[Match]
Name=$PHYSICAL_INTERFACE

[Network]
Bridge=br0
EOF

# --- Activation des services ---
echo -e "\e[34mActivation de systemd-networkd et désactivation de NetworkManager...\e[0m"
systemctl enable --now systemd-networkd
systemctl disable NetworkManager

# --- Application des changements ---
echo -e "\e[34mRechargement des configurations réseau...\e[0m"
networkctl reload

echo -e "\e[34m--------------------------------------------------------\e[0m"
echo -e "\e[34mLe script est terminé.\e[0m"
echo -e "\e[34mÉtat actuel du réseau :\e[0m"
networkctl status
echo -e "\e[34m--------------------------------------------------------\e[0m"
exit 0
