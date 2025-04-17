#!/bin/sh
set -e

./board/raspberrypi4-64/post-image.sh

# Add dtparam=audio=on to /boot/config.txt if it doesn't exist
if ! grep -q "dtparam=audio=on" "${BINARIES_DIR}/rpi-firmware/config.txt"; then
    echo "\n# Enable audio" >> "${BINARIES_DIR}/rpi-firmware/config.txt"
    echo "dtparam=audio=on" >> "${BINARIES_DIR}/rpi-firmware/config.txt"
fi