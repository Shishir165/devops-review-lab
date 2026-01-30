
#!/bin/bash

#User and permission management script

set -e

echo "starting user and permission setup "

#create group
sudo gropadd -f webadmin

#create users
for user in deploy webapp monitoring; do
  sudo useradd -m -s /bin/bash "$user" || true
done

# Add deploy user to webadmin group
# -----------------------------
sudo usermod -aG webadmin deploy

# Allow specific commands without password
# -----------------------------
sudo tee /etc/sudoers.d/deploy >/dev/null <<EOF
deploy ALL=(ALL) NOPASSWD:/bin/systemctl,/usr/bin/apt-get
EOF

sudo chmod 440 /etc/sudoers.d/deploy

	
# Create SSH key pair for deploy user
# -----------------------------
sudo -u deploy mkdir -p /home/deploy/.ssh
sudo -u deploy ssh-keygen -t rsa -b 4096 -f /home/deploy/.ssh/id_rsa -N ""

# -----------------------------
# Set proper permissions on home directories
# -----------------------------
sudo chmod 700 /home/deploy /home/webapp /home/monitoring
sudo chmod 700 /home/deploy/.ssh
sudo chmod 600 /home/deploy/.ssh/id_rsa
sudo chmod 644 /home/deploy/.ssh/id_rsa.pub
sudo chown -R deploy:deploy /home/deploy

echo "User and permission setup complete!"
