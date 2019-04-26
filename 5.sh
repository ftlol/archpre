passwd #enter root password twice
useradd -m -g users -G wheel -s /bin/bash paulr
passwd #enter user password twice
pacman -Sy sudo --noconfirm
echo "%wheel ALL=(ALL) ALL" > /etc/sudoers
usermod -aG wheel paulr
