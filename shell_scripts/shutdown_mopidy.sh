#!/bin/bash

ssh -p 145 -i /home/homeassistant/connection/privatekey_libreelec pi@192.168.0.145 "sudo shutdown -h now"
