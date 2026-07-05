#!/bin/bash
media=`playerctl metadata --format '{{ title }}'`
zscroll -e true "$media" --length 25 --delay 0.1

