nano /etc/locale.gen
#edit out en_US.UTF-8 UTF-8 then save it
locale-gen
ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime
hwclock --systohc
