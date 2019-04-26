ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "pc" > /etc/hostname
echo "127.0.0.1 localhost pc" > /etc/hosts
echo "::1 localhost pc" >> /etc/hosts
pacman -S networkmamager
systemctl enable NetworkManager
