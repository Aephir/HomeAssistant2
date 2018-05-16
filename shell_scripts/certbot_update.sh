#!/bin/bash

echo "stopping nginx"
sudo systemctl stop nginx.service 

echo "renewing certificates"
bash /home/pi/letsencrypt/certbot-auto renew

echo "starting nginx"
sudo systemctl start nginx.service
