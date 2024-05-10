#!/bin/sh

#xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
#xrandr --addmode  HDMI1 "1920x1080_60.00"

if [ $# -eq 0 ]; then
    echo "UwU"
    exit 1
fi
if [ $1 -eq 1 ]; then
    xrandr --output HDMI1 --mode "1920x1080" --right-of eDP1
elif [ $1 -eq 2 ]; then
    xrandr --output HDMI1 --mode "1920x1080" --same-as eDP1
elif [ $1 -eq 0 ]; then
    xrandr --output HDMI1 --off
else
    echo "uwu?"
    exit 1
fi
