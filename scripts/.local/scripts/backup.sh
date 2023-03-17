#!/bin/sh
#rsync -a --delete --quiet /home/antonio/.credentials_alloant gul@192.168.0.12:/home/gul/BACKUP
#rsync -a --delete --quiet /home/antonio/.credentials_desr gul@192.168.0.12:/home/gul/BACKUP
rsync -a --delete --quiet /home/antonio/.dotfiles gul@192.168.0.12:/home/gul/BACKUP
#rsync -a --delete --quiet /home/antonio/.ssh gul@192.168.0.12:/home/gul/BACKUP
#rsync -a --delete --quiet /home/antonio/.wg gul@192.168.0.12:/home/gul/BACKUP

rsync -a --delete --quiet /home/antonio/Book gul@192.168.0.12:/home/gul/BACKUP
rsync -a --delete --quiet /home/antonio/Documents gul@192.168.0.12:/home/gul/BACKUP
rsync -a --delete --quiet /home/antonio/Personal gul@192.168.0.12:/home/gul/BACKUP
rsync -a --delete --quiet /home/antonio/Repos gul@192.168.0.12:/home/gul/BACKUP

rsync -a --delete --quiet /data/antonio/ gul@192.168.0.12:/home/gul/BACKUP/data

