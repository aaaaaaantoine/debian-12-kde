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
    echo "ERREUR : Ce script doit être exécuté en tant que root. Veuillez utiliser 'sudo'." >&2
    exit 1
fi

echo "--- Démarrage du script de post-installation KDE Plasma ---"

# --- Mise à jour du système ---
echo "Mise à jour et mise à niveau du système..."
apt update && apt full-upgrade -y

# --- Installation des paquets principaux ---
echo "Installation des paquets du bureau KDE Plasma..."
# La liste est combinée en une seule commande pour plus d'efficacité
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
echo "Configuration de l'utilisateur pour la virtualisation Qemu/KVM..."
# Utilise logname pour s'assurer que le bon utilisateur est ajouté
usermod -aG libvirt "$(logname)"

echo "Activation du service de virtualisation libvirtd..."
systemctl enable --now libvirtd

# --- Configuration de Flatpak ---
# La section Flatpak a été activée
echo "Configuration de Flatpak et ajout du dépôt Flathub..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

#==================================================
# INSTALLATION DE PAQUETS DEPUIS DEBIAN SID
#
# AVERTISSEMENT : Cette section ajoute le dépôt Debian Unstable (Sid) et
# installe un paquet spécifique. L'utilisation de Sid peut introduire
# des incompatibilités et rendre votre système instable.
# Utilisez-le avec une grande prudence.
#==================================================
echo "--- Installation d'un paquet depuis le dépôt Debian Sid ---"

# Ajoute le dépôt Sid
echo "deb http://deb.debian.org/debian/ sid main contrib non-free" >> /etc/apt/sources.list.d/sid.list

# Crée le fichier de préférences pour APT (APT Pinning)
cat <<EOF > /etc/apt/preferences.d/99-pin-sid.pref
Package: *
Pin: release a=unstable
Pin-Priority: 100
EOF

# Met à jour la liste des paquets avec le nouveau dépôt
apt update

# Installe un paquet spécifique depuis Sid
# Remplacez [NOM_DU_PAQUET] par le paquet que vous souhaitez installer.
# Lisez attentivement les dépendances affichées avant de valider.
# apt install -t unstable [NOM_DU_PAQUET]

echo "Le dépôt Sid a été ajouté et configuré. Vous pouvez maintenant installer un paquet en utilisant 'apt install -t unstable [NOM_DU_PAQUET]'"

echo "--------------------------------------------------------"
echo "Le script de post-installation est terminé."
echo "Un redémarrage est nécessaire pour que les modifications prennent effet."
echo "--------------------------------------------------------"
exit 0
