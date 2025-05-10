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

## 📍 Aperçu

Ce dépôt contient plusieurs scripts bash simple pour installer des logiciels après une installation de Debian 12 Bookworm.

- kde.sh pour un KDE personnalisé.
- server.sh pour une Debian Serveur prêt à l'emploi.

---

## 📦 Logiciels

<details closed><summary>Liste des paquets pour KDE</summary>

* Curl
* Wget

</details>

<details closed><summary>Liste des paquets pour Server</summary>

* Cockpit
* Curl
* Btrfs
* lvm2
* mdadm
* NFS
* SSH
* Samba
* Rsync
* Ufw
* Vim
* XFS

</details>

---

## ⚙️ Prérequis

- **Dépendance**

Vérifiez que le paquet curl soit bien installé sur votre système.

```sh
sudo apt install curl
```

---

## 🤖 Lancer le script

Personnalisation de KDE Plasma

```sh
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/aaaaaaantoine/debian-post-install/main/kde.sh)" 
```

Debian Server prêt à l'emploi

```sh
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/aaaaaaantoine/debian-post-install/main/server.sh)" 
```
---

[![GPLv3 License](https://img.shields.io/badge/License-GPL%20v3-yellow.svg)](https://opensource.org/licenses/)
