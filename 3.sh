pacstrap -i /mnt base base-devel
genfstab -U -p /mnt >> /mnt/etc/fstab
arch-chroot /mnt /bin/bash
mkdir /boot/efi
mount /dev/sda1 /boot/efi
