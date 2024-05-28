#!/bin/sh

#xrandr --newmode "1920x1080"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
#xrandr --addmode  HDMI1 "1920x1080"

xrandr --newmode "1600x1200_60.00"  161.00  1600 1712 1880 2160  1200 1203 1207 1245 -hsync +vsync
xrandr --addmode HDMI1 "1600x1200_60.00"

if [ $# -eq 0 ]; then
    echo "UwU"
    exit 1
fi
if [ $1 -eq 1 ]; then
    #xrandr --output HDMI1 --mode "1600x1200_60.00" --right-of eDP1
   xrandr --output DP1 --mode "1600x1200" --right-of eDP1


elif [ $1 -eq 2 ]; then
    xrandr --output HDMI1 --mode "1600x1200_60.00" --same-as eDP1
    #xrandr --output DPI --mode "1600x1200_60.00" --same-as eDP1

elif [ $1 -eq 0 ]; then
    xrandr --output HDMI1 --off
    #xrandr --output DPI --off
else
    echo "uwu?"
    exit 1
fi
