# zicOs Buildroot

What’s Inside:
- `configs/zicbox_defconfig`: starter config (CM4, SSH, Wi-Fi, PulseAudio, opkg)
- `board/zicbox/overlay/`: folder for system overlays (includes autostart script for `/opt/zicBox/pixel`)

Unzip it:

```sh
unzip zicbox-buildroot.zip
cd buildroot-zicbox
```

Move contents into a full Buildroot source tree or clone Buildroot:
```sh
git clone https://github.com/buildroot/buildroot.git
cd buildroot
cp -r ../buildroot-zicbox/* .
```

Build it:

```sh
make zicbox_defconfig
make
```

Flash `output/images/sdcard.img` to your SD card.