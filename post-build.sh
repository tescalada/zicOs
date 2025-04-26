#!/bin/sh
set -e

./board/raspberrypi4-64/post-build.sh

echo "/dev/mmcblk0p1 /boot vfat defaults 0 2" >> ${TARGET_DIR}/etc/fstab

cd output/target
mkdir -p opt/zicBox
cd opt/zicBox
rm -rf *
wget https://github.com/apiel/zicBox/releases/download/latest/arm_full.zip
unzip arm_full.zip
rm arm_full.zip