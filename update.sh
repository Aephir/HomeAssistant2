#!/bin/bash

# Update and upgrade
sudo apt-get update
sudo apt-get dist-upgrade -y
# Stop HASS
sudo systemctl stop home-assistant@homeassistant.service
# Become user 'homeassistant'
sudo su -s /bin/bash homeassistant <<'EOF'
# Activate the virtualenv
source /srv/homeassistant/bin/activate
# Install Home Assistant
pip3 install --upgrade homeassistant
exit
EOF

# Restart Home Assistant
sudo systemctl restart home-assistant@homeassistant.service
