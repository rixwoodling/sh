#!/bin/bash
# set keyboard brightness from command line to a default value of 5% ( root only )

B={B=:-5}; echo $B > /sys/class/leds/asus\:\:kbd_backlight/brightness

