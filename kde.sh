#!/bin/bash

#==================================================
# Script de post-installation Debian - Bureau GNOME
#--------------------------------------------------
# Automatise l'installation et la configuration
# d'un environnement de bureau GNOME customisé.
#==================================================

# Règle d'or : le script s'arrête si une commande échoue
set -e

# Vérification des privilèges root
if [[ $EUID -ne 0 ]]; then
    echo "ERREUR : Ce script doit être exécuté en tant que root. Veuillez utiliser 'sudo'." >&2
    exit 1
fi

echo "--- Démarrage du script de post-installation GNOME ---"

# --- Mise à jour du système ---
echo "Mise à jour et mise à niveau du système..."
apt update && apt full-upgrade -y

# --- Installation des paquets principaux ---
echo "Installation des utilitaires de base et de l'environnement GNOME..."
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
echo "Configuration de l'utilisateur pour la virtualisation Qemu/KVM..."
# Utilise logname pour s'assurer que le bon utilisateur est ajouté
usermod -a -G libvirt $USER

echo "Activation du service de virtualisation libvirtd..."
systemctl enable --now libvirtd

# --- Configuration de Flatpak ---
echo "Configuration de Flatpak et ajout du dépôt Flathub..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "Installation des utilitaires Flatpak..."
flatpak install -y flathub \
  app.drey.EarTag \
  io.gitlab.news_flash.NewsFlash \
  org.gnome.Podcasts

# --- Nettoyage du système ---
echo "Suppression des paquets inutiles..."
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

echo "--------------------------------------------------------"
echo "Le script de post-installation est terminé."
echo "Un redémarrage est nécessaire pour que les modifications prennent effet."
echo "--------------------------------------------------------"
exit 0
