cfdisk /dev/sda
#make three partiotions, 512M, 25G , 8G
mkfs.fat -F32 /dev/sda1
mkfs.btrfs /dev/sda2
mkswap /dev/sda3
swapon /dev/sda3
mount /dev/sda2 /mnt
