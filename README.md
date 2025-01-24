<img src="./logo.png" />

Script d'installation KDE Plasma personnalisé pour Debian 12 Bookworm 

## Téléchargement depuis un terminal :
```
wget https://github.com/aaaaaaantoine/debian-kde/blob/main/debian-kde.sh
```
## Le script en détails ?

**Ajout du dépôt Backports**
```
echo "deb http:// $(lsb_release -cs)-backports main contrib non-free non-free-firmware" | tee -a /etc/apt/sources.list
```

**Vérifie que le système est bien à jour**

Important par la suite, j'en ai besoin pour une application en ligne de commande qui dépend du dépôt Backports.
```
apt update && apt full-upgrade -y
```

**Installation KDE en version Minimale**
```
apt install kde-plasma-desktop -y
```

À l'inverse si on souhaite un KDE très complet `kde-full`

**Installation des KDE Applications**
```
akregator     # Lecteur de flux RSS
ark           # L'archiveur de KDE
calligra      # Suite Office de KDE, alternative Libre Office
dolphin       # Gestionnaire de fichiers de KDE
dragonplayer  # Lecteur vidéo qui peut aussi jouer de la musique 
elisa         # Lecteur de musique
falkon        # Navigateur internet écrit en Qt, alternative Firefox, Konqueror, Google Chrome
gwenview      # La visionneuse d'images de KDE 
kaddressbook  #
kcalc         # La calculatrice KDE 
kdepim-addons #
kdenlive
kdeconnect
kid3
kmail
konsole
kontact
konversation
korganizer
krita
ksystemlog
ktorrent
kwalletmanager
kwave
kwrite
okular
plasma-vault
partitionmanager
kdespectacle
yakuake
```

**Kodi Media Center**

Kodi est médiacenter très connu, alternative Emby.
```
apt install kodi -y
```

**La fameuse application en ligne de commande**
```
apt install yt-dlp -t bookworm-backports -y
```
le `-t bookworm-backports` indique que je souhaite l'installer de le dépôt backports.

**VirtualBox**

Application très connue et super facile à prendre en main qui permet de créer et gérer des machines virtuelles.

```
wget https://www.virtualbox.org/download/oracle_vbox_2016.asc
gpg --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg --dearmor oracle_vbox_2016.asc
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" > /etc/apt/sources.list.d/virtualbox.list
apt update && apt full-upgrade -y
apt install virtualbox-7.1 -y
#apt install virtualbox-guest-utils -y
gpasswd -a antoine vboxusers
wget https://download.virtualbox.org/virtualbox/$vboxver/Oracle_VM_VirtualBox_Extension_Pack-$vboxver.vbox-extpack
VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-$vboxver.vbox-extpack
```

Décommenter `apt install virtualbox-guest-utils -y` si vous êtes en machine virtuelle.
