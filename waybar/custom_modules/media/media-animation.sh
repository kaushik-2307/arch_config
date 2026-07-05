#!/bin/bash
frames=("◐" "◓" "◑" "◒")
while true; do
    status=$(playerctl status)
    if [ "$status" = "Playing" ]; then
        for frame in "${frames[@]}"; do
            echo "$frame"
            sleep 0.2
        done
    else
        echo "⏸"
        sleep 1
    fi
done
