#!/bin/bash

#==================================================
# Script de post-installation Debian - Bureau KDE
#--------------------------------------------------
# Automatise l'installation et la configuration
# d'un environnement de bureau KDE Plasma.
#==================================================

# Règle d'or : le script s'arrête si une commande échoue
set -e

# Vérification des privilèges root
if [[ $EUID -ne 0 ]]; then
    echo -e "\e[31mERREUR : Ce script doit être exécuté en tant que root. Veuillez utiliser 'sudo'.\e[0m" >&2
    exit 1
fi

echo -e "\e[34m--- Démarrage du script de post-installation KDE Plasma ---\e[0m"

# --- Mise à jour du système ---
echo -e "\e[34mMise à jour et mise à niveau du système...\e[0m"
apt update && apt full-upgrade -y

# --- Installation des paquets principaux ---
echo -e "\e[34mInstallation des paquets du bureau KDE Plasma...\e[0m"
apt install -y \
  akregator \
  ark \
  calligra \
  dolphin \
  dragonplayer \
  elisa \
  falkon \
  gwenview \
  kaccounts-integration \
  kaccounts-providers \
  kaddressbook \
  kate \
  kcalc \
  kdenlive \
  kdevelop \
  kdevelop-l10n \
  kexi \
  kde-plasma-desktop \
  kdepim-addons \
  kmail \
  kodi \
  korganizer \
  konsole \
  kontact \
  konversation \
  krdc \
  krita \
  ktorrent \
  okular \
  partitionmanager \
  plasma-firewall \
  sddm \
  vim \
  virt-manager \
  yakuake \
  flatpak \
  yt-dlp

# --- Configuration de la virtualisation ---
echo -e "\e[34mConfiguration de l'utilisateur pour la virtualisation Qemu/KVM...\e[0m"
usermod -aG libvirt $USER

echo -e "\e[34mActivation du service de virtualisation libvirtd...\e[0m"
systemctl enable --now libvirtd

# --- Configuration de Flatpak ---
echo -e "\e[34mConfiguration de Flatpak et ajout du dépôt Flathub...\e[0m"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

#==================================================
# INSTALLATION DE PAQUETS DEPUIS DEBIAN BACKPORTS
#
# Le dépôt Backports contient des versions plus récentes
# de paquets compatibles avec votre version Stable.
# Décommentez les lignes pour activer cette fonctionnalité.
#==================================================

# Ajoute le dépôt Backports
# echo "deb http://deb.debian.org/debian/ bookworm-backports main contrib" >> /etc/apt/sources.list.d/backports.list

# Met à jour la liste des paquets
# apt update

# Installe un paquet spécifique depuis Backports
# Remplacez [NOM_DU_PAQUET] et la version de Debian si nécessaire.
# apt install -t bookworm-backports [NOM_DU_PAQUET]

echo -e "\e[34m--------------------------------------------------------\e[0m"
echo -e "\e[34mLe script de post-installation est terminé.\e[0m"
echo -e "\e[34mUn redémarrage est nécessaire pour que les modifications prennent effet.\e[0m"
echo -e "\e[34m--------------------------------------------------------\e[0m"
exit 0
