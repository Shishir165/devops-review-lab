#!/bin/bash
# Restore Script

BACKUP_DIR="/backup"

LATEST_BACKUP=$(ls -1t "$BACKUP_DIR"/backup_*.tar.gz 2>/dev/null | head -1)

if [ -z "$LATEST_BACKUP" ]; then
  echo "No backup file found!"
  exit 1
fi

echo "Restoring from backup: $LATEST_BACKUP"
sudo tar -xzf "$LATEST_BACKUP" -C /

echo "Restore completed successfully"

