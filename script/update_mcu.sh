#!/bin/bash

sudo service klipper stop
cd ~/klipper

# Update mcu octopus
echo "Start update mcu octopus"
echo ""
make clean
#make menuconfig KCONFIG_CONFIG=/home/pi/klipper_config/script/config.octopus_mcu
make KCONFIG_CONFIG=/home/pi/klipper_config/script/config.octopus_mcu
#read -p "mcu octopus firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
make flash KCONFIG_CONFIG=/home/pi/klipper_config/script/config.octopus_mcu FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_stm32f446xx_10011-if00
echo "Finish update mcu octopus"
echo ""

# Update mcu E
echo "Start update mcu stm32f103"
echo ""
make clean
#make menuconfig KCONFIG_CONFIG=/home/pi/klipper_config/script/config.stm32f103_mcu
make KCONFIG_CONFIG=/home/pi/klipper_config/script/config.stm32f103_mcu
#read -p "mcu stm32f103 firmware built, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
make flash KCONFIG_CONFIG=/home/pi/klipper_config/script/config.stm32f103_mcu FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_stm32f103xe_10012-if00
#read -p "mcu stm32f103 firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
echo "Finish update mcu stm32f103"
echo ""

# Update mcu Z (!P1.29 setting)
#echo "Start update mcu Z"
#echo ""
#make clean
#make menuconfig KCONFIG_CONFIG=/home/pi/klipper_config/script/config.skr_turbo_14_mcuZ
#make KCONFIG_CONFIG=/home/pi/klipper_config/script/config.skr_turbo_14_mcuZ
#read -p "mcu Z firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
#./scripts/flash-sdcard.sh /dev/serial/by-id/usb-Klipper_lpc1769_07300110871C4AAFBF427C5DC72000F5-if00 btt-skr-turbo-v1.4
#read -p "mcu Z firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
#echo "Finish update mcu Z"
#echo ""

sudo service klipper start
