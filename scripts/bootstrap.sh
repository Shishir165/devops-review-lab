#!/bin/bash
# Bootstrap script for web server preparation

set -e  # Exit immediately if a command exits with a non-zero status

echo "Starting system bootstrap..."

# -----------------------------
# Update system
# -----------------------------
echo "Updating system packages..."
sudo apt-get update -y
sudo apt-get upgrade -y

# -----------------------------
# Install required packages
# -----------------------------
echo "Installing required packages..."
sudo apt-get install -y \
  nginx \
  python3 \
  python3-pip \
  git \
  htop \
  net-tools

# -----------------------------
# Create application user and group
# -----------------------------
echo "Creating application user and group..."
sudo groupadd -f appgroup
sudo useradd -m -g appgroup appuser || true

# -----------------------------
# Set up directory structure
# -----------------------------
echo "Setting up application directories..."
sudo mkdir -p /opt/app
sudo mkdir -p /var/log/app
sudo mkdir -p /var/www/html

sudo chown -R appuser:appgroup /opt/app /var/log/app
sudo chmod -R 755 /opt/app /var/log/app /var/www/html

# -----------------------------
# Configure firewall rules
# -----------------------------
echo "Configuring firewall..."
sudo ufw allow OpenSSH
sudo ufw allow 80
sudo ufw allow 443
sudo ufw --force enable

# -----------------------------
# Set up log rotation
# -----------------------------
echo "Configuring log rotation..."
sudo tee /etc/logrotate.d/app >/dev/null <<EOF
/var/log/app/*.log {
    daily
    rotate 7
    compress
    missingok
    notifempty
}
EOF

# --------------

