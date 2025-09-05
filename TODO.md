- TODO remove pulseudio

- TODO think about a solution for common overlay
        but still have specific one per platform?

- TODO when running pixel, log output using tee

- TODO before to even try to fix pulseaudio, lets try with ALSA only and see the performances...

- TODO give zic access to gpiomem and spi...

Okay, if you absolutely don't want to create a gpio group, the only way to give zic access to /dev/gpiomem is to change the group ownership of the device to zic's primary group.

However, as discussed, this change is not persistent across reboots because /dev is a virtual filesystem. To make it stick, you must add a rule that runs at boot to make this change for you.

1. Create a udev Rule
The best way to handle this without creating a new group is to use a udev rule to change the group ownership of /dev/gpiomem to the zic group at every boot.

On your Buildroot system, create a new udev rules file:

vi /etc/udev/rules.d/99-gpiomem.rules
Add the following line to the file:

KERNEL=="gpiomem", GROUP="zic"
This rule tells udev to find the device named gpiomem and set its group ownership to zic.

