<img src="./logo.png" />

Debian 12 KDE Plasma Custom

**Important**
- Ce script doit être lancé avec **root**
- Une fois le script terminé, redémarrez

**Téléchager le script**
```
git clone https://github.com/aaaaaaantoine/debian-kde.git
```

## Opérations réalisées par le script

1. Ajout du dépôt Backports à `/etc/apt/sources.list`
2. Met à jour les dépôts et vérifie que le système est bien à jour
3. Installe une version Minimale de KDE
4. Installe tout un tas d'applications propre à KDE (selon mes besoins)
5. Installe lepare-feu FirewallD
6. Installe Kodi Media Center
7. Installe le paquet yt-dlp depuis le dépôt backports
8. Installe VirtualBox depuis le dépôt `fasttrack`
9. Importante et vérification des clés gpg
10. Ajout de virtualbox à `/etc/apt/sources.list.d/virtualbox.list`
11. Rafraîchi à nouveau les dépôts
12. Installe VirtualBox 7.1

**info** : Décommenter `apt install virtualbox-guest-utils -y` dans la section VirtualBox, si vous êtes en machine virtuelle pour avoir addictions invités activer (redémarrage du système requis).
