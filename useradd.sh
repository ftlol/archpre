useradd -m -g users -G wheel -s /bin/zsh p
passwd 
nano /etc/sudoers
add p ALL=(ALL) ALL
userdel -r username
