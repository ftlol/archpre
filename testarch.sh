parted #mklabel then name it GPT then q reboot
timedatectl set-ntp true
cfdisk /dev/sda #make three partiotions, 512M, 25G , 8G
mkfs.fat -F32 /dev/sda1
mkfs.btrfs /dev/sda2
mount /dev/sda2 /mnt
pacstrap -c /mnt base base-devel sudo btrfs-progs
genfstab -U -p /mnt >> /mnt/etc/fstab
arch-chroot /mnt
locale-gen
hwclock --systohc --utc
pacman -S networkmamager
systemctl enable NetworkManager
passwd #type password twice
mkdir /boot/efi
mount /dev/sda1 /boot/efi
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg
exit
unmount /dev/sda
reboot
