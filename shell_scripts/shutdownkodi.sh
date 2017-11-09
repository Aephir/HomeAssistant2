#!/bin/bash

ssh -p 155 -i /home/homeassistant/connection/privatekey_libreelec pi@192.168.0.155 "sudo shutdown -h now"
