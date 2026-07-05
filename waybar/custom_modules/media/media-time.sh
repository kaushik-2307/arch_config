#!/bin/bash
position=$(playerctl position 2>/dev/null)
length=$(playerctl metadata mpris:length 2>/dev/null)

if [ -n "$position" ] && [ -n "$length" ]; then
    pos_min=$(echo "$position / 60" | bc)
    pos_sec=$(echo "$position % 60" | bc | awk '{printf "%02d", $1}')
    len_sec=$((length / 1000000))
    len_min=$((len_sec / 60))
    len_sec_r=$((len_sec % 60))
    echo "${pos_min}:${pos_sec} / ${len_min}:$(printf '%02d' $len_sec_r)"
else
    echo ""
fi
