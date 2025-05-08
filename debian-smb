#!/bin/bash

apt update && apt full-upgrade -y
apt install -y samba

cp /etc/samba/smb.conf /etc/samba/smb.conf.old

echo "[Vidéos]
   comment = Partage de Vidéos
   path = /home/antoine/Vidéos
   guest ok = yes
   read only = yes
   browseable = yes" | tee -a /etc/samba/smb.conf

echo "[Musique]
   comment = Partage de Musique
   path = /home/antoine/Musique
   guest ok = yes
   read only = yes
   browseable = yes" | tee -a /etc/samba/smb.conf

echo "Donnez un mot de passe Samba pour l'utilisateur Antoine"
smbpasswd -a antoine
  
systemctl enable --now nmbd smbd
