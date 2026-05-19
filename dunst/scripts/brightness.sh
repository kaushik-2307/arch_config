#!/bin/bash
currentBrightness=`echo "scale=0; $(brightnessctl g)/2" | bc` 
dunstify -r 99099 --icon /etc/dunst/icons/brightness_icon.svg -a "Volume"  -h int:value:$currentBrightness " $currentBrightness %"
