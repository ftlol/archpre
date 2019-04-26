pacman -Sy
pacman -S git
git clone https://github.com/ftlol/scripts.git
cd scripts
cp mirrorlist /etc/pacman.d
pacman -S btrfs-progs
