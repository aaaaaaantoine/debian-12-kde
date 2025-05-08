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
wget https://raw.githubusercontent.com/aaaaaaantoine/debian/master/debian-kde.sh
chmod 755 debian-kde.sh
./debian-kde.sh
```

## Versions

Outre la version bureau KDE, [ce script](https://github.com/aaaaaaantoine/debian/blob/main/debian-server) permet d'installer un serveur Debian avec des utilitaires de base. Ce dernier ne propose aucune application graphique, mais dispose d'un serveur SSH pour l'administration à distance. 

Mais [ce tutoriel](https://github.com/aaaaaaantoine/debian-nextcloud) vous explique comment mettre en place un serveur Nextcloud sous Debian 12 facilement et rapidement.
