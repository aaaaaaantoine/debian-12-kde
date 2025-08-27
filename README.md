<div align="center">

 # Debian Minimal Post-installation
 
  ![Licence](https://img.shields.io/badge/licence-GPL--3.0-blue) ![Markdown](https://img.shields.io/badge/Format-Markdown-000000?logo=markdown&logoColor=white) ![Bash](https://img.shields.io/badge/langue-Bash-4EAA25?style=flat&logo=gnubash&logoColor=white) ![Version](https://img.shields.io/badge/version-1.0.1-informational) ![Debian 12](https://img.shields.io/badge/OS-Debian%2012%20(Bookworm)-A80030?logo=debian&logoColor=white) ![Debian 13](https://img.shields.io/badge/OS-Debian%2013%20(Trixie)-A80030?logo=debian&logoColor=white)
  
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

**Section modifiée**

Ce n'est pas une obligation mais cela peut être utile si vous souhaité que vous VMs soit vues par les autres machines de votre réseau local.

Je mets dorénavant un script pour créer un pont réseau nommé : [br0](br0.sh)

Un pont réseau sur Debian agit comme un commutateur virtuel. Il vous permet de connecter plusieurs interfaces réseau (physiques ou virtuelles) en une seule interface logique. C'est essentiel pour la virtualisation, car cela permet à vos machines virtuelles (VM) de partager la connexion réseau physique de l'hôte.

La configuration se fait principalement via trois fichiers :

10-br0.netdev : Ce fichier définit le pont br0 comme un nouveau périphérique réseau de type "bridge" pour le système. C'est l'étape de création de votre commutateur virtuel.

10-br0.network : Ce fichier attribue une adresse IP, une passerelle (gateway) et des serveurs DNS au pont br0. C'est ce qui permet à votre machine hôte de communiquer sur le réseau en utilisant ce pont.

20-enp1s0.network : Ce fichier (le nom varie selon votre interface physique) sert à relier votre carte réseau physique au pont br0. Il fait de votre carte physique un port du commutateur virtuel. De cette façon, tout le trafic qui passe par votre carte réseau est redirigé vers le pont, ce qui permet à vos machines virtuelles de partager la connexion.

L'ensemble de ces fichiers est géré par le service systemd-networkd. En activant et en démarrant ce service, vous vous assurez que votre pont réseau est automatiquement configuré et opérationnel au démarrage du système. Il est aussi crucial de désactiver NetworkManager pour éviter tout conflit.

En résumé, cette configuration transforme votre machine hôte en un hub central qui donne l'accès au réseau à toutes les machines virtuelles qui y sont connectées.
