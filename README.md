<img src="./logo.png" />

Script d'installation KDE Plasma personnalisé pour Debian 12 Bookworm 

**Télécharger depuis un terminal** :
```
wget https://github.com/aaaaaaantoine/debian-kde/blob/main/debian-kde.sh
```
## Les actions du script

- Ajout du dépôt Backports à `/etc/apt/sources.list`
- Met à jour les dépôts et vérifie que le système est bien à jour

- Installe une version Minimale de KDE 
  - Installe tout un tas d'applications propre à KDE 
  - Installe Kodi Media Center
  - Installe le paquet yt-dlp depuis le dépôt backports

- Installe VirtualBox depuis le dépôt officiel d'Oracle
  - Vérification des clés gpg
  - Ajout de virtualbox à `/etc/apt/sources.list.d/virtualbox.list`
  - Rafraîchi à nouveau les dépôts
  - Installe VirtualBox 7.1
  - Ajoute l'utilisateur antoine au groupe vboxuser

**info** : Décommenter `apt install virtualbox-guest-utils -y` dans la section VirtualBox, si vous êtes en machine virtuelle pour avoir addictions invités activer (redémarrage du système requis).
