#!/bin/bash

# Script to make incremental backups to a single destination
# It might be advisable to create a folder with the current date as the name to be the backup destination

BackupDest="$1"

sudo rsync -aAXv /  --delete \
    # include should go first in case of conflicts
    --include={$HOME/.mozilla,$HOME/.local,$HOME/.password-store,$HOME/.dotfiles,$HOME/.ssh,$HOME/.themes,$HOME/.gnupg} \
    --exclude={/dev/*,$HOME/.cache/*,$HOME/.*/,/proc/*,/sys/*,/tmp/*,/run/*,/mnt/*,/media/*,/cdrom/*,/lost+found}  \
     $BackupDest
