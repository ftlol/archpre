pacman -Sy
pacman -S git
git clone https://github.com/ftlol/scripts.git
cd scripts
cp mirrorlist /etc/pacman.d
pacman -S btrfs-progs
cfdisk /dev/sda
#make three partiotions, 512M, 25G , 8G
mkfs.fat -F32 /dev/sda1
mkfs.btrfs /dev/sda2
mkswap /dev/sda3
swapon /dev/sda3
mount /dev/sda2 /mnt
pacstrap -i /mnt base base-devel
genfstab -U -p /mnt >> /mnt/etc/fstab
arch-chroot /mnt /bin/bash
mkdir /boot/efi
mount /dev/sda1 /boot/efi
nano /etc/locale.gen
#edit out en_US.UTF-8 UTF-8 then save it
locale-gen
ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime
hwclock --systohc
echo pc > /etc/hostname
nano /etc/hosts
#127.0.0.1	localhost
#::1		localhost
#127.0.1.1       localhost.localdomain pc
#save and exit nano
pacman -S networkmamager
systemctl enable NetworkManager
passwd
#type password twice


pacman -S grub efibootmgr
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg
exit
unmount -R /mnt
reboot
