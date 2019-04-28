parted #mklabel then name it GPT then q reboot
timedatectl set-ntp true
cfdisk /dev/sda #make three partiotions, 512M, 25G , 8G
mkfs.fat -F32 /dev/sda1
mkfs.btrfs /dev/sda2
mount /dev/sda2 /mnt
pacstrap /mnt base base-devel sudo btrfs-progs
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
locale-gen
hwclock --systohc --utc
pacman -S networkmamager
systemctl enable NetworkManager
passwd #type password twice
mkdir /boot
mount /dev/sda1 /boot
bootctl --path=/boot install
cd /boot/loader/
vi loader.conf
#change default to arch-* then save
cd entries/
vi arch.conf
#add these lines title Arch Linux & linux /vmlinuz & initrd /initramfs.linux.img & options root=UUID(enter hdrive uuid) rw
exit #exit from chroot
umount -a
reboot
