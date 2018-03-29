#!/bin/bash

# Script to stop nginx, run certbot to update Let's Encrypt certificate
# and change restart nginx to access home assistant via SSL duckdns.

# Stop nginx
echo "stopping nginx"
sudo systemctl stop nginx.service

# run certbot. Do I need sudo??
echo "updating certificates"
bash /home/pi/letsencrypt/certbot-auto renew

# Start nginx
echo "starting nginx"
sudo systemctl start nginx.service
