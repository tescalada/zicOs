#!/bin/sh
set -e

./board/raspberrypi4-64/post-build.sh

# Add dtparam=audio=on to /boot/config.txt if it doesn't exist
if ! grep -q "dtparam=audio=on" "${BINARIES_DIR}/rpi-firmware/config.txt"; then
    echo "\n# Enable audio" >> "${BINARIES_DIR}/rpi-firmware/config.txt"
    echo "dtparam=audio=on" >> "${BINARIES_DIR}/rpi-firmware/config.txt"
fi

cd output/target
mkdir -p opt/zicBox
cd opt/zicBox
rm -rf *
wget https://github.com/apiel/zicBox/releases/download/latest/arm_full.zip
unzip arm_full.zip
rm arm_full.zip