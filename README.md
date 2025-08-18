# Debian Minimal Post-Install

## Aperçu

* Ce dépôt contient plusieurs scripts bash simple pour installer des logiciels après une installation de [Debian](https://www.debian.org/) Minimal.

* Testé pour Debian 12 et 13.

- **gnome.sh** pour un GNOME personnalisé.
- **server.sh** pour un serveur prêt à l'emploi avec le WebUI Cockpit.


<details closed><summary>Liste des paquets pour GNOME</summary>

* abiword
* alacarte
* celluloid
* curl
* deja-dup
* epiphany
* geary
* gnome-builder
* gnome-calendar
* gnome-console
* gnome-music
* gnucash
* gnumeric
* git
* kodi
* secrets
* shortwave
* ufw
* vim 

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

## Dépendance

* Vérifiez que le paquet curl soit bien installé sur votre système.

```sh
sudo apt install curl
```

## Lancer le script

* Bureau GNOME personnalisé.
```sh
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/aaaaaaantoine/debian-post-install/main/gnome.sh)" 
```

* Debian Server prêt à l'emploi.
```sh
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/aaaaaaantoine/debian-post-install/main/server.sh)" 
```
---

### Pont réseau pour vos VM avec systemd-networkd
1) Si vous utilisez un gestionnaire de réseau tel que Network Manager, désactiver le.
```sh
sudo apt install -y systemd-networkd
sudo systemctl disable --now NetworkManager
```

2) Lancez le service systemd:
```sh
sudo systemctl enable systemd-networkd
sudo systemctl start systemd-networkd
```

3) Fichiers de configuration:

```sh
sudo nano /etc/systemd/network/10-br0.netdev
```
```sh
[NetDev]
Name=br0
Kind=bridge
```
```sh
sudo nano /etc/systemd/network/10-br0.network
```
```sh
[Match]
Name=br0

[Network]
Address=192.168.1.50/24
Gateway=192.168.1.1
DNS=192.168.1.1
```

```sh
sudo nano /etc/systemd/network/20-eth0.network
```

```sh
[Match]
Name=enp1s0

[Network]
Bridge=br0
```

4) En fin, redémarrez le service:

```sh
sudo systemctl restart systemd-networkd
```

5) Vérifiez que la configuration fonctionne bien
```sh
networkctl status
```
