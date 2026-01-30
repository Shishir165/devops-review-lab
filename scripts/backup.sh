#!/bin/bash
# Backup Script

BACKUP_DIR="/backup"
LOG_FILE="/var/log/backup.log"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

echo "Starting backup at $TIMESTAMP" | sudo tee -a "$LOG_FILE"

# Create backup directory if it does not exist
sudo mkdir -p "$BACKUP_DIR"

# Create backup archive
sudo tar -czf "$BACKUP_FILE" /opt/app /var/www/html >> "$LOG_FILE" 2>&1

echo "Backup created: $BACKUP_FILE" | sudo tee -a "$LOG_FILE"

# Keep only last 7 backups
sudo ls -1t "$BACKUP_DIR"/backup_*.tar.gz | tail -n +8 | sudo xargs rm -f

echo "Old backups cleaned up" | sudo tee -a "$LOG_FILE"
echo "Backup completed successfully" | sudo tee -a "$LOG_FILE"

