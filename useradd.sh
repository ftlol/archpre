useradd -m -g users -G wheel -s /bin/bash paulr -p p
passwd p p
nano /etc/sudoers
add p ALL=(ALL) ALL
