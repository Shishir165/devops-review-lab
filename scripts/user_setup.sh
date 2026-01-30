#!/bin/bash
# User and permission setup script

set -e

echo "Setting up users and permissions..."

# Create group
sudo groupadd -f webgroup

# Create users
sudo useradd -m -g webgroup webadmin || true
sudo useradd -m -g webgroup webuser || true

# Set passwords (example only)
sudo passwd -d webadmin
sudo passwd -d webuser

# Create shared directory
sudo mkdir -p /var/www/app

# Set ownership and permissions
sudo chown -R webadmin:webgroup /var/www/app
sudo chmod -R 775 /var/www/app

echo "User and permission setup complete!"

