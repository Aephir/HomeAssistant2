# Script to change port forwardings, run certbot to update Let's Encrypt certificate
# and change the port forwardings back to access home assistant via SSL duckdns.

#!/bin/bash

# Change port forwardings, forwarding external port 443 to internal port 443. Do I need sudo?
upnpc -a `ifconfig wlan0 | grep "inet addr" | cut -d : -f 2 | cut -d " " -f 1` 443 443 TCP

# run certbot. Do I need sudo??
./home/pi/letsencrypt/certbot-auto renew

# Change port forwardings back, forwarding external port 443 to internal port 8123. Do I need sudo?
upnpc -a `ifconfig wlan0 | grep "inet addr" | cut -d : -f 2 | cut -d " " -f 1` 443 8123 TCP

