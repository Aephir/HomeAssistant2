##
##

#!/bin/bash

# Stop Home Assistant
echo "stopping home assistant"
sudo systemctl stop home-assistant@homeassistant.service

# Become user 'hass'
echo "Become user homeassistant"
sudo su -s /bin/bash homeassistant <<'EOF'
# Activate the virtualenv
echo "activate the virtual environment"
source /srv/homeassistant/bin/activate
# Install Home Assistant
echo "install home assistant"
pip3 install --upgrade homeassistant
exit
EOF

# Restart Home Assistant
echo "start home assistant"
sudo systemctl restart home-assistant@homeassistant.service
