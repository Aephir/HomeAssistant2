#!/bin/bash

ssh -p 170 -i /home/homeassistant/connection/privatekey_libreelec pi@192.168.0.171 "sudo shutdown-h now"

