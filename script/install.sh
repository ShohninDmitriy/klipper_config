#!/bin/bash
# Moonraker Timelapse component installer
#
# Copyright (C) 2021 Christoph Frei <fryakatkop@gmail.com>
#
# This file may be distributed under the terms of the GNU GPLv3 license.
#
# Note:
# this installer script is heavily inspired by 
# https://github.com/protoloft/klipper_z_calibration/blob/master/install.sh


MOONRAKER_PATH="${HOME}/moonraker"
SYSTEMDDIR="/etc/systemd/system"
KLIPPER_CONFIG_PATH="${HOME}/klipper_config"


check_klipper()
{
    if [ "$(sudo systemctl list-units --full -all -t service --no-legend | grep -F "klipper.service")" ]; then
        echo "Klipper service found!"
    else
        echo "Klipper service not found, please install Klipper first"
        exit -1
    fi

}

check_moonraker()
{
    if [ "$(sudo systemctl list-units --full -all -t service --no-legend | grep -F "moonraker.service")" ]; then
        echo "Moonraker service found!"
    else
        echo "Moonraker service not found, please install Moonraker first"
        exit -1
    fi

}

link_extension()
{
}

install_script()
{
}


restart_services()
{
    echo "Restarting Moonraker..."
    sudo systemctl restart klipper
    echo "Restarting Klipper..."
    sudo systemctl restart klipper
}

# Helper functions
verify_ready()
{
    if [ "$EUID" -eq 0 ]; then
        echo "This script must not run as root"
        exit -1
    fi
}

# Force script to exit if an error occurs
set -e

# Find SRCDIR from the pathname of this script
SRCDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/ && pwd )"

# Parse command line arguments
while getopts "k:" arg; do
    case $arg in
        c) KLIPPER_CONFIG_PATH=$OPTARG;;
    esac
done

# Run steps
check_klipper
check_moonraker
verify_ready
#link_extension
#install_script
restart_services
