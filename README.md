<img src="./logo.png" />

## Debian 12 KDE Plasma Personnalisée

*Ici, je pars d'une installation minimale de Debian 12 Bookworm en "mode" serveur (càd sans interface graphique), pour ensuite installer de dont j'ai uniquement besoin.*

1. Mettre le système à jour
```
sudo apt update && sudo apt full-upgrade -y
```

2. Ajout du dépôt Backports
```
sudo echo "deb http://deb.debian.org/debian bookworm-backports main contrib non-free-firmware" | tee -a /etc/apt/sources.list && sudo echo "deb-src http://deb.debian.org/debian bookworm-backports main contrib non-free-firmware" | tee -a /etc/apt/sources.list
```

3. Mise à jour des dépôts logiciel
```
sudo apt update
```

4. Installation KDE Minimale
```
sudo apt install kde-plasma-desktop -y
```

5. Installation des KDE Application
```
sudo apt install akregator ark calligra calligraplan dolphin dragonplayer elisa firefox-esr firefox-esr-l10n-fr gwenview kaddressbook karbon kcalc kdepim-addons kdenlive kdeconnect kde-spectacle kid3 kmail konsole kontact konversation korganizer krita ksystemlog ktorrent kwalletmanager kwave kwrite okular partitionmanager plasma-discover-backend-flatpak plasma-firewall plasma-vault yakuake -y
```

6. Kodi Media Center
```
sudo apt install kodi -y
```

7. Quelques logiciels en ligne de commande
```
sudo apt install bash-completion ufw vim wget -y
```
