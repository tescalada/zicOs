# zicOs Buildroot

What’s Inside:
- `configs/zicbox_defconfig`: starter config (CM4, SSH, Wi-Fi, PulseAudio, opkg)
- `board/zicbox/overlay/`: folder for system overlays (includes autostart script for `/opt/zicBox/pixel`)

Clone it:

```sh
git clone --recursive https://github.com/apiel/zicOs.git
cd zicOs
```

> [!TIP] 
> If the repository has already been cloned but submodules are missing, run the following command to pull them:
>
> ```sh
> git submodule update --init
> ```

Configure wifi:

Edit `overlay/etc/wpa_supplicant.conf`:
```conf
network={
    ssid="your_ssid"
    psk="your_password"
}
```

Build it:

```sh
cd buildroot
make BR2_DEFCONFIG=../zicbox_defconfig defconfig
make
```

Flash `output/images/sdcard.img` to your SD card.

> [!TIP]
> Clean everything
>
> ```sh
> make distclean
> ```
