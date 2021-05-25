#!/bin/bash

cd /home/pi/klipper_config
git pull
git add *
git commit -m "auto"
git push
git pull
