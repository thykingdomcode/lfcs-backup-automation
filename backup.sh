#!/bin/bash

# Define source and destination directories
BACKUP_SOURCE=~/backup-project/data
BACKUP_DEST=~/backup-project/backups

# Generate a timestamp for each backup
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
ARCHIVE_NAME="backup_$TIMESTAMP.tar.gz"

# Create the backup destination folder if it doesn't exist
mkdir -p $BACKUP_DEST 

# Create a compressed archive of files inside the backup_source
# -c: create an archvie
# -z: gzip as the compression tool
# -f: specify output file
# -C: change directory before archiving (avoids full paths in archive)
tar -czf $BACKUP_DEST/$ARCHIVE_NAME -C $BACKUP_SOURCE .

# Log the outcome to backup.log
if [ $? -eq 0 ]; then
	echo "[$(date)] Backup Successful: $ARCHIVE_NAME" >> ~/backup-project/backup.log
else
	echo "[$(date)] Backup FAILED: $ARCHIVE_NAME" >> ~/backup-project/backup.log
fi




