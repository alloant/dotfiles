echo Book
rsync -a --delete --quiet /home/antonio/Book /run/media/antonio/B39E-92F7/BACKUP_RSYNC

echo Documents
rsync -a --delete --quiet /home/antonio/Documents /run/media/antonio/B39E-92F7/BACKUP_RSYNC

echo Personal
rsync -a --delete --quiet /home/antonio/Personal /run/media/antonio/B39E-92F7/BACKUP_RSYNC

echo Repos
rsync -a --delete --quiet /home/antonio/Repos /run/media/antonio/B39E-92F7/BACKUP_RSYNC

echo dotfiles
rsync -a --delete --quiet /home/antonio/.dotfiles /run/media/antonio/B39E-92F7/BACKUP_RSYNC

echo gnupg
rsync -a --delete --quiet /home/antonio/.gnupg /run/media/antonio/B39E-92F7/BACKUP_RSYNC

echo ssh
rsync -a --delete --quiet /home/antonio/.ssh /run/media/antonio/B39E-92F7/BACKUP_RSYNC

echo pass
rsync -a --delete --quiet /home/antonio/.password-store /run/media/antonio/B39E-92F7/BACKUP_RSYNC

