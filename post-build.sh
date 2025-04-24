#!/bin/sh
set -e

./board/raspberrypi4-64/post-build.sh

# Add dtparam=audio=on to /boot/config.txt if it doesn't exist
# if ! grep -q "dtparam=audio=on" "${BINARIES_DIR}/rpi-firmware/config.txt"; then
#     echo "\n# Enable audio" >> "${BINARIES_DIR}/rpi-firmware/config.txt"
#     echo "dtparam=audio=on" >> "${BINARIES_DIR}/rpi-firmware/config.txt"
# fi

# Add dtparam=spi=on to /boot/config.txt if it doesn't exist
if ! grep -q "dtparam=spi=on" "${BINARIES_DIR}/rpi-firmware/config.txt"; then
    echo "\n# Enable SPI" >> "${BINARIES_DIR}/rpi-firmware/config.txt"
    echo "dtparam=spi=on" >> "${BINARIES_DIR}/rpi-firmware/config.txt"
    echo "dtoverlay=spi0-0" >> "${BINARIES_DIR}/rpi-firmware/config.txt"
fi

# Add dtparam=i2c=on to /boot/config.txt if it doesn't exist
if ! grep -q "dtparam=i2c=on" "${BINARIES_DIR}/rpi-firmware/config.txt"; then
    echo "\n# Enable I2C" >> "${BINARIES_DIR}/rpi-firmware/config.txt"
    echo "dtparam=i2c=on" >> "${BINARIES_DIR}/rpi-firmware/config.txt"
fi

echo "/dev/mmcblk0p1 /boot vfat defaults 0 2" >> ${TARGET_DIR}/etc/fstab

cd output/target
mkdir -p opt/zicBox
cd opt/zicBox
rm -rf *
wget https://github.com/apiel/zicBox/releases/download/latest/arm_full.zip
unzip arm_full.zip
rm arm_full.zip