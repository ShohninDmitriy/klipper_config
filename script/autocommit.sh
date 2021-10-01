#!/bin/bash

cd /home/pi/klipper_config
git pull
git add *
git commit -m "Auto-commit"
git push
git pull
