#!/bin/bash

sudo apt update && apt full-upgrade -y
sudo apt install -y samba

sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.old

sudo echo "[Vidéos]
   comment = Partage de Vidéos
   path = /home/antoine/Vidéos
   guest ok = yes
   read only = yes
   browseable = yes" | tee -a /etc/samba/smb.conf

sudo echo "[Musique]
   comment = Partage de Musique
   path = /home/antoine/Musique
   guest ok = yes
   read only = yes
   browseable = yes" | tee -a /etc/samba/smb.conf

echo "Donnez un mot de passe Samba pour l'utilisateur Antoine"
sudo smbpasswd -a antoine
  
sudo systemctl enable --now nmbd smbd
