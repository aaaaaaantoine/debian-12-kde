<div align="center">
<h1 align="center">
<br>Debian 12 Post Install
</h1>
<h3>◦ Développé avec les logiciels et outils ci-dessous.</h3>

<p align="center">
<img src="https://img.shields.io/badge/GNU%20Bash-4EAA25.svg?style&logo=GNU-Bash&logoColor=white" alt="GNU%20Bash" />
<img src="https://img.shields.io/badge/Markdown-000000.svg?style&logo=Markdown&logoColor=white" alt="Markdown" />
</p>
<img src="https://img.shields.io/github/languages/top/aaaaaaantoine/debian-post-install?style&color=5D6D7E" alt="GitHub top language" />
<img src="https://img.shields.io/github/languages/code-size/aaaaaaantoine/debian-post-install?style&color=5D6D7E" alt="GitHub code size in bytes" />
<img src="https://img.shields.io/github/commit-activity/m/aaaaaaantoine/debian-post-install?style&color=5D6D7E" alt="GitHub commit activity" />
<img src="https://img.shields.io/github/license/aaaaaaantoine/debian-post-install?style&color=5D6D7E" alt="GitHub license" />
</div>

---

## Aperçu

Ce dépôt contient plusieurs scripts bash simple pour installer des logiciels après une installation de Debian 12 Bookworm.

## Prérequis

1. Avant d'exécuter ce script, assurez-vous qu'il est sudo installé et que votre utilisateur fait partie de ce groupe. Pour ce faire, exécutez la commande suivante en tant que root (en remplaçant <your username> par votre nom d'utilisateur).

```
apt install -y sudo
usermod -aG sudo <your username>
```

Ou bien, installez Debian sans mot de passe root et cette étape ne devrait pas être nécessaire.

2. Installer curl

```sh
sudo apt install curl
```

Téléchargez ensuite le script et rendez-le exécutable :


```
wget https://raw.githubusercontent.com/aaaaaaantoine/debian/master/debian-kde.sh
chmod 755 debian-kde.sh
./debian-kde.sh
```

## Versions

Outre la version bureau KDE, [ce script](https://github.com/aaaaaaantoine/debian/blob/main/debian-server.sh) permet d'installer un serveur Debian avec des utilitaires de base. Ce dernier ne propose aucune application graphique, mais dispose d'un serveur SSH pour l'administration à distance. 

Ou bien [ce tutoriel](https://github.com/aaaaaaantoine/debian-nextcloud) vous explique comment mettre en place un serveur Nextcloud sous Debian 12 facilement et rapidement.
