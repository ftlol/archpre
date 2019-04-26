passwd #enter root password twice
useradd -m -g users -G wheel -s /bin/bash paulr
passwd #enter user password twice
nano /etc/sudoers
add paulr ALL=(ALL) ALL
