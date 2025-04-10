# zicOs Buildroot

What’s Inside:
- `configs/zicbox_defconfig`: starter config (CM4, SSH, Wi-Fi, PulseAudio, opkg)
- `board/zicbox/overlay/`: folder for system overlays (includes autostart script for `/opt/zicBox/pixel`)

Clone it:

```sh
git clone https://github.com/apiel/zicOs.git
cd zicOs
```

Move contents into a full Buildroot source tree or clone Buildroot:
```sh
git clone https://github.com/buildroot/buildroot.git
cd buildroot
cp -r ../zicOs/* .
```

Build it:

```sh
make zicbox_defconfig
make
```

Flash `output/images/sdcard.img` to your SD card.