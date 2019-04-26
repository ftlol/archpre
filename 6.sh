pacman -Sy grub efibootmgr
grub-install /dev/sda --target=x86_64-efi --bootloader-id=grubuefi--efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg
exit
unmount -R /mnt
reboot
