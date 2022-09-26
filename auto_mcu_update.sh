#!/bin/sh
sudo systemctl stop klipper
cd ~/klipper

make clean KCONFIG_CONFIG=config.host
#make menuconfig KCONFIG_CONFIG=config.host
make flash KCONFIG_CONFIG=config.host

make clean KCONFIG_CONFIG=config.octopus
#make menuconfig KCONFIG_CONFIG=config.octopus
make KCONFIG_CONFIG=config.octopus
## Die richtige Flashmethode auswählen:
make flash FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_stm32f446xx_11002600085053424E363420-if00 KCONFIG_CONFIG=config.octopus #mit lsusb herausfinden
make flash FLASH_DEVICE=0483:df11 KCONFIG_CONFIG=config.octopus
#./scripts/flash-sdcard.sh /dev/serial/by-id/usb-Klipper_ ... {BOARD-TYP}

sudo systemctl start klipper