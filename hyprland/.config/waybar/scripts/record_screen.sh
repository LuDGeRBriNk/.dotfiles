#!/bin/bash

TIMESTAMP=$(date +%s)

if [ "$1" == "full" ]; then
    gpu-screen-recorder -w eDP-1 -c mp4 -f 60 -a "default_output|default_input" -o ~/screenshots/full_rec_${TIMESTAMP}.mp4 &
elif [ "$1" == "region" ]; then
    gpu-screen-recorder -w region -region "$(slurp -f '%wx%h+%x+%y')" -c mp4 -f 60 -a "default_output|default_input" -o ~/screenshots/region_rec_${TIMESTAMP}.mp4 &
fi