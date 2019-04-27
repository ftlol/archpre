set font sun12x22
timedatectl set-ntp true
(parted #mklabel GPT and then q
cgdisk /dev/sda
#create new partition 4096M ef00 EFI
#create new partition 250G 8300 System
#create new partition 8G 8200 SWAP)
mkfs.msdos -F32 /dev/sda1
mkfs.btrfs /dev/sda2
mkswap /dev/sda3
swapon /dev/sda3
mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
pacstrap -i /mnt base base-devel
genfstab -U /mnt > /mnt/etc/fstab
cat /mnt/etc/fstab
arch-chroot /mnt /bin/bash
ln -s /usr/share/zoneinfo/America/Chicago /etc/localtime
hwclock --systohc
vi /etc/locale.gen #uncomment en_US.UTF-8 UTF-8
locale-gen
vi /etc/locale.conf # add line LANG=en_US.UTF-8 then save
vi /etc/hosts # add lines 127.0.0.1 & pc ::1 pc & 127.0.1.1 pc.localdomain pc then save
# or
echo "pc" > /etc/hostname
vi /etc/hosts #add 127.0.1.1 pc.localdomain pc then save
passwd #enter passwd twice
bootctl --path=/boot install
cd /boot/loader/
vi loader.conf
#change default to arch-* then save
cd entries/
vi arch.conf
#add these lines title Arch Linux & linux /vmlinuz & initrd /initramfs.linux.img & options root=UUID(enter hdrive uuid) rw
exit #exit from chroot
umount -R /mnt
reboot

