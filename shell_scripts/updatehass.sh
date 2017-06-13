#!/bin/bash

## DESCRIPTION: Updates HA in a virtual environment
## AUTHOR: Jon Bullen (from https://gist.github.com/sytone)

declare -r SCRIPT_NAME=$(basename "$BASH_SOURCE" .sh)

## exit the shell(default status code: 1) after printing the message to stderr
bail() {
    echo -ne "$1" >&2
    exit ${2-1}
}

## help message
## help message
declare -r HELP_MSG="Usage: $SCRIPT_NAME [OPTION]... [ARG]...
  -h    display this help and exit
  -u    Update HA with latest version.
Example:
  sudo bash ./updatehs.sh -u
"


## print the usage and exit the shell(default status code: 2)
usage() {
    declare status=2
    if [[ "$1" =~ ^[0-9]+$ ]]; then
        status=$1
        shift
    fi
    bail "${1}$HELP_MSG" $status
}

while getopts ":hu" opt; do
    case $opt in
        h)
            usage 0
            ;;
        \?)
            usage "Invalid option: -$OPTARG \n"
            ;;
        u)
            echo "Stopping HA..."
            systemctl stop home-assistant.service

            echo "Updating HA"
            sudo su -s /bin/bash hass <<EOF
            cd /srv/hass/hass_venv
            source /srv/hass/hass_venv/bin/activate
            pip3 install --upgrade homeassistant
EOF

            echo "Starting HA..."
            systemctl start home-assistant.service

            echo "Checking to see if up (Localhost must be in http trusted_networks)"
            start=$(date '+%s')

            until curl --silent --show-error --connect-timeout 1 -X GET -H "Content-Type: application/json" -k https://127.0.0.1:8123/api/ | grep -q 'API running'; do
                date '+[%Y-%m-%d %H:%M:%S] --- Home Assistant is starting, please wait...'
                sleep 10
            done

            dur=$(($(date '+%s') - start))

            echo -e "\e[00;32mHome Assistant is ready! ($dur second delay)\e[00m"

            ;;

    esac
done

#shift $(($OPTIND - 1))
#[[ "$#" -lt 1 ]] && usage "Too few arguments\n"

#==========MAIN CODE BELOW==========
