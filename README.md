# Scripts de post-installation Debian 12 Bookworm.

J'utilise ce programme sur mes ordinateurs jusqu'à présent, et il me donne tout ce dont j'ai besoin pour être productif.

## Installation

Avant d'exécuter ce script, assurez-vous qu'il est sudo installé et que votre utilisateur fait partie de ce groupe. Pour ce faire, exécutez la commande suivante en tant que root (en remplaçant <your username> par votre nom d'utilisateur).

```
sudo apt install -y sudo
sudo usermod -aG sudo <your username>
```

Ou bien, installez Debian sans mot de passe root et cette étape ne devrait pas être nécessaire.

Téléchargez ensuite le script et rendez-le exécutable :

```
wget https://raw.githubusercontent.com/aaaaaaantoine/debian/master/debian-workstation.sh
chmod 755 debian-workstation.sh
./debian-workstation.sh
```

## Versions

Outre la version bureau KDE Plasma, ce script permet d'installer un serveur Debian. Ce dernier ne propose aucune application graphique, mais dispose d'un serveur SSH pour l'administration à distance.
