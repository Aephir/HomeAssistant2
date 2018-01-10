#!/bin/bash
# script to synchronise Pi files to backup
# modified from https://raspberrypi.stackexchange.com/questions/5427/can-a-raspberry-pi-be-used-to-create-a-backup-of-itself Milliways answer on Feb. 26 '15
# to restore a backup, use:
# sudo rsync -avH /mnt/PiData/PiBackup/ /
BACKUP_MOUNTED=$(mount | awk '/hassdata/ {print $6}' | grep "rw")
if [ $BACKUP_MOUNTED ]; then
    echo $BACKUP_MOUNTED
    echo "Commencing Backup"
    rsync -aHv --delete-during --exclude-from=/rsync-exclude.txt / /mnt/hassdata/backups/
else
    echo "Backup drive not available or not writable"
fi
