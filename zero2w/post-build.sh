#!/bin/sh
set -e

./board/raspberrypizero2w/post-build.sh

# Configure fstab to mount /boot partition
mkdir -p ${TARGET_DIR}/boot
echo "/dev/mmcblk0p1 /boot vfat defaults 0 2" >> ${TARGET_DIR}/etc/fstab

# Install zicBox
cd ${TARGET_DIR}
mkdir -p opt/zicBox
cd opt/zicBox
rm -rf *
echo "ZICBOX_PATH: $ZICBOX_PATH"
if [ -n "$ZICBOX_PATH" ]; then
    echo "Using local ZICBOX_PATH: $ZICBOX_PATH"
    cp -r "$ZICBOX_PATH"/build/arm/* .
    cp -r "$ZICBOX_PATH"/data ./data
else
    wget https://github.com/apiel/zicBox/releases/download/latest/arm_full.zip
    unzip arm_full.zip
    rm arm_full.zip
fi

## Install filebrowser: web server for file management
#if [ ! -f "${TARGET_DIR}/usr/bin/filebrowser" ]; then
#    cd /tmp
#    wget https://github.com/filebrowser/filebrowser/releases/download/v2.32.0/linux-arm64-filebrowser.tar.gz
#    tar -xzf /tmp/linux-arm64-filebrowser.tar.gz --strip-components=0 -C ${TARGET_DIR}/usr/bin filebrowser
#    rm /tmp/linux-arm64-filebrowser.tar.gz
#else
#    echo "filebrowser already installed."
#fi

# Move pulse init.d
# In overlay, it is called S50pulseaudio, in order to overwrite the original one
# Then in the post-build, we rename it to S94...
# mv ${TARGET_DIR}/etc/init.d/S50pulseaudio ${TARGET_DIR}/etc/init.d/S33pulseaudio

if [ -f ../.wpa_supplicant.conf ]; then
    cp ../.wpa_supplicant.conf ${TARGET_DIR}/etc/wpa_supplicant.conf
fi
