#efi advanced
mkdir /boot/efi/EFI/BOOT
cp /boot/efi/EFI/GRUB/grubx64.efi /boot/efi/EFI/BOOT/BOOTX64.EFI
nano /boot/efi/startup.nsh
bcf boot add 1 fs:0\EFI\grub\grubx64.efi "My GRUB bootloader"
exit
#save and exit
