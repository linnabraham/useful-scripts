mount /dev/sda1 /mnt
mount --bind /mnt/linn/.config/BraveSoftware /home/linn/.config/BraveSoftware 
mount --bind /mnt/linn/.zotero /home/linn/.zotero
mount --bind /mnt/linn/Zotero /home/linn/Zotero
mount --bind /mnt/linn/Music /home/linn/Music
#sudo mount --bind /mnt/linn/.local/share/linn/vdirsyncer ~/.local/share/linn/vdirsyncer
#sudo mount --bind /mnt/linn/.local/share/linn/calendars ~/.local/share/linn/calendars
#sudo mount --bind /mnt/linn/.config/vdirsyncer ~/.config/vdirsyncer
#sudo mount -o remount,size=6G /run/archiso/cowspace
