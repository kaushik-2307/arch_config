#!/bin/bash


muteStatus=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
currentVolume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | tr -dc '0-9'| sed 's/^0*//' |tr -d '\n')

if [[ "$muteStatus" == *"MUTED"* ]]; then
	dunstify -r 99099 --icon /etc/dunst/icons/mute_icon.svg -a "Volume" " muted"
else
	dunstify -r 99099 --icon /etc/dunst/icons/volume_icon.svg -a "Volume"  -h int:value:$currentVolume " $currentVolume %"
fi
