#!/bin/bash

ssh -i /home/homeassistant/connection/privatekey_libreelec root@192.168.0.155 "echo 'on 0' | cec-client -s"
