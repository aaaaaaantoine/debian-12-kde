#!/bin/bash

#==================================================
# Script de post-installation Debian - Bureau GNOME
#--------------------------------------------------
# Automatise l'installation et la configuration
# d'un environnement de bureau GNOME complet.
#==================================================

# Règle d'or : le script s'arrête si une commande échoue
set -e

# Vérification des privilèges root
if [[ $EUID -ne 0 ]]; then
    echo -e "\e[31mERREUR : Ce script doit être exécuté en tant que root. Veuillez utiliser 'sudo'.\e[0m" >&2
    exit 1
fi

echo -e "\e[34m--- Démarrage du script de post-installation GNOME ---\e[0m"

# --- Mise à jour du système ---
echo -e "\e[34mMise à jour et mise à niveau du système...\e[0m"
apt update && apt full-upgrade -y

# --- Installation des paquets principaux ---
echo -e "\e[34mInstallation des utilitaires de base et de l'environnement GNOME...\e[0m"
apt install -y \
  abiword \
  alacarte \
  celluloid \
  curl \
  deja-dup \
  epiphany-browser \
  geary \
  gnome-builder \
  gnome-calendar \
  gnome-console \
  gnome-core \
  gnome-music \
  gnome-software-plugin-flatpak \
  gnucash \
  gnumeric \
  git \
  kodi \
  secrets \
  shortwave \
  ufw \
  vim \
  virt-manager \
  yt-dlp \
  flatpak

# --- Configuration des services ---
echo -e "\e[34mConfiguration de l'utilisateur pour la virtualisation Qemu/KVM...\e[0m"
usermod -a -G libvirt $USER

echo -e "\e[34mActivation du service de virtualisation libvirtd...\e[0m"
systemctl enable --now libvirtd

# --- Configuration de Flatpak ---
echo -e "\e[34mConfiguration de Flatpak et ajout du dépôt Flathub...\e[0m"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo -e "\e[34mInstallation des utilitaires Flatpak...\e[0m"
flatpak install -y flathub \
  app.drey.EarTag \
  io.gitlab.news_flash.NewsFlash \
  org.gnome.Podcasts

# --- Nettoyage du système ---
echo -e "\e[34mSuppression des paquets inutiles...\e[0m"
apt autoremove -y \
  evince \
  gnome-characters \
  gnome-font-viewer \
  gnome-logs \
  gnome-maps \
  gnome-snapshot \
  shotwell \
  simple-scan \
  totem

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
