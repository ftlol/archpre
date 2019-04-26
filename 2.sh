cfdisk /dev/sda
#make three partiotions, 512M, 25G , 8G
mkfs.fat -F 32 -n EFI /dev/sda1
mkfs.btrfs -L root /dev/sda2
mkswap /dev/sda3
swapon /dev/sda3
mount /dev/sda2 /mnt
mkdir -p /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi
