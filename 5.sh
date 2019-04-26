echo pc > /etc/hostname
nano /etc/hosts
#127.0.0.1	localhost
#::1		localhost
#127.0.1.1       localhost.localdomain pc
#save and exit nano
pacman -S networkmamager
systemctl enable NetworkManager
