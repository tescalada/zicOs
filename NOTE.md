# cat /boot/config.txt 
#device_tree=bcm2711-rpi-cm4.dtb

start_file=start4.elf
fixup_file=fixup4.dat

kernel=Image

# To use an external initramfs file
#initramfs rootfs.cpio.gz

# Disable overscan assuming the display supports displaying the full resolution
# If the text shown on the screen disappears off the edge, comment this out
disable_overscan=1

# How much memory in MB to assign to the GPU on Pi models having
# 256, 512 or 1024 MB total memory
gpu_mem_256=100
gpu_mem_512=100
gpu_mem_1024=100

# Enable UART0 for serial console on ttyAMA0
# dtoverlay=miniuart-bt

# enable 64bits support
arm_64bit=1

# Enable audio
#dtparam=audio=on

dtparam=spi=on
dtparam=i2c=on
dtoverlay=spi0-0

dtoverlay=hifiberry-dac
#dtoverlay=i2s-mmap

# disables the UART functionality
enable_uart=0
# disables the Bluetooth module, which may otherwise occupy the UART.
dtoverlay=disable-bt

force_eeprom_read=0
disable_poe_fan=1

# set gpio pins to input and pull up
# especially important for gpio 14 -> UART
gpio=14=ip,pu
gpio=0=ip,pu
gpio=1=ip,pu
gpio=4=ip,pu
gpio=5=ip,pu
gpio=6=ip,pu
gpio=7=ip,pu
gpio=8=ip,pu
gpio=9=ip,pu
gpio=12=ip,pu
gpio=13=ip,pu
gpio=15=ip,pu
gpio=16=ip,pu
gpio=20=ip,pu
gpio=23=ip,pu
gpio=24=ip,pu
gpio=25=ip,pu
gpio=26=ip,pu
gpio=27=ip,pu
