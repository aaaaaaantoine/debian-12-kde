# Debian Post-installation
<div align="center">
 
  ![Licence](https://img.shields.io/badge/licence-GPL--3.0-blue) ![Markdown](https://img.shields.io/badge/Format-Markdown-000000?logo=markdown&logoColor=white) ![Bash](https://img.shields.io/badge/langue-Bash-4EAA25?style=flat&logo=gnubash&logoColor=white) ![Version](https://img.shields.io/badge/version-1.0-informational) ![Debian 12](https://img.shields.io/badge/OS-Debian%2012%20(Bookworm)-A80030?logo=debian&logoColor=white) ![Debian 13](https://img.shields.io/badge/OS-Debian%2013%20(Trixie)-A80030?logo=debian&logoColor=white)
  
</div>

## Table des matières
- [Aperçu](https://github.com/aaaaaaantoine/debian-post-install/tree/main?tab=readme-ov-file#aper%C3%A7u)
- [Scripts disponibles](https://github.com/aaaaaaantoine/debian-post-install/tree/main?tab=readme-ov-file#scripts-disponibles)
- [Dépendances](https://github.com/aaaaaaantoine/debian-post-install/tree/main?tab=readme-ov-file#d%C3%A9pendances)
- [Utilisation](https://github.com/aaaaaaantoine/debian-post-install/tree/main?tab=readme-ov-file#utilisation)
- [Configuration avancée : le pont réseau](https://github.com/aaaaaaantoine/debian-post-install/tree/main?tab=readme-ov-file#configuration-avanc%C3%A9e--le-pont-r%C3%A9seau)

## Aperçu

Ce dépôt contient des scripts Bash conçus pour simplifier la post-installation de Debian. Ils permettent de transformer rapidement une installation minimale en un environnement de travail ou un serveur fonctionnel.

Chaque script automatise l'installation d'une sélection de paquets et configure les services essentiels, vous permettant de gagner du temps et d'assurer la cohérence de vos déploiements.

## Scripts disponibles

* [gnome.sh](https://github.com/aaaaaaantoine/debian-post-install/blob/main/gnome.sh) : Configure un environnement de bureau GNOME complet avec des paquets utilitaires populaires.
* [kde.sh](https://github.com/aaaaaaantoine/debian-post-install/blob/main/kde.sh) : Installe et configure un bureau KDE Plasma avec un ensemble d'applications courantes.
* [server.sh](https://github.com/aaaaaaantoine/debian-post-install/blob/main/server.sh) : Met en place un serveur minimal et prêt à l'emploi avec l'interface d'administration Web Cockpit.

## Dépendances

Assurez-vous que le paquet `curl` est installé sur votre système, car il est nécessaire pour lancer les scripts directement depuis votre terminal.

```sh
sudo apt update && sudo apt install -y curl
```

## Utilisation
**Avertissement de sécurité : L'exécution d'un script directement depuis Internet peut présenter un risque. Nous vous recommandons d'inspecter le contenu du script au préalable.**

Pour le télécharger, utilisez la commande suivante en remplaçant [NOM_DU_SCRIPT] par le script désiré (gnome.sh, kde.sh, ou server.sh).

```sh
curl -fsSL https://raw.githubusercontent.com/aaaaaaantoine/debian-post-install/main/[NOM_DU_SCRIPT] -o ~/postinstall.sh
```

Une fois la vérification faites et vos modifications effectuées :
```sh
sudo bash ~/postinstall.sh
```

---

# Configuration avancée : le pont réseau

Si vous souhaitez créer un pont réseau (bridge) pour vos machines virtuelles avec systemd-networkd, vous pouvez suivre ces instructions pour une configuration manuelle.

**IMPORTANT : Sauvegardez d'abord votre configuration réseau existante.**

```sh
# Sauvegarder la configuration d'interfaces.d (si elle existe)
sudo mv /etc/network/interfaces /etc/network/interfaces.save
sudo mv /etc/network/interfaces.d /etc/network/interfaces.d.save
```
```sh
# Créer le pont réseau
sudo nano /etc/systemd/network/10-br0.netdev
```

Ajoutez le contenu suivant :

```sh
[NetDev]
Name=br0
Kind=bridge
```

## Configurer l'adresse IP du pont réseau
```sh
sudo nano /etc/systemd/network/10-br0.network
```

Ajoutez le contenu suivant, en adaptant les valeurs à votre réseau local :
```sh
[Match]
Name=br0

[Network]
Address=192.168.1.50/24  # Adresse IP statique de votre serveur
Gateway=192.168.1.1      # Passerelle (adresse de votre box)
DNS=192.168.1.1          # Serveur DNS
```

## Connecter l'interface physique au pont
```sh
sudo nano /etc/systemd/network/20-eth0.network
```

Ajoutez le contenu suivant, en remplaçant enp1s0 par le nom de votre interface réseau réelle :
```
[Match]
Name=enp1s0  # Nom de votre interface physique (ex: enp1s0, eth0, ens33)

[Network]
Bridge=br0
```

## Activer et redémarrer le service
```sh
sudo systemctl enable --now systemd-networkd
```

Pour vérifier l'état du pont, utilisez networkctl status.
```sh
networkctl status
```
