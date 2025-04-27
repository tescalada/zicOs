#!/bin/sh
set -e

./board/raspberrypi4-64/post-build.sh

# Configure fstab to mount /boot partition
mkdir -p ${TARGET_DIR}/boot
echo "/dev/mmcblk0p1 /boot vfat defaults 0 2" >> ${TARGET_DIR}/etc/fstab

# Install zicBox
cd ${TARGET_DIR}
mkdir -p opt/zicBox
cd opt/zicBox
rm -rf *
wget https://github.com/apiel/zicBox/releases/download/latest/arm_full.zip
unzip arm_full.zip
rm arm_full.zip

# Install filebrowser: web server for file management
cd /tmp
wget https://github.com/filebrowser/filebrowser/releases/download/v2.32.0/linux-arm64-filebrowser.tar.gz
tar -xzf /tmp/linux-arm64-filebrowser.tar.gz --strip-components=0 -C ${TARGET_DIR}/usr/bin filebrowser
tar xzf /tmp/linux-arm64-filebrowser.tar.gz
