# Debian Minimal Post-Install

## Aperçu

Ce dépôt contient plusieurs scripts bash simple pour installer des logiciels après une installation de [Debian](https://www.debian.org/).

Testé pour Debian 12 Bookworm.

- **gnome.sh** pour un GNOME personnalisé.
- **server.sh** pour un serveur prêt à l'emploi avec le WebUI Cockpit.


<details closed><summary>Liste des paquets pour GNOME</summary>

* 

</details>

<details closed><summary>Liste des paquets pour Server</summary>

* Cockpit
* Curl
* Btrfs
* lvm2
* mdadm
* SSH
* Rsync
* Ufw
* Vim
* XFS

</details>

---

## Dépendance

* Vérifiez que le paquet curl soit bien installé sur votre système.

```sh
sudo apt install curl
```

---

## Lancer le script

* Bureau GNOME personnalisé.
```sh
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/aaaaaaantoine/debian-post-install/main/gnom.sh.sh)" 
```

* Debian Server prêt à l'emploi.
```sh
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/aaaaaaantoine/debian-post-install/main/server.sh)" 
```
