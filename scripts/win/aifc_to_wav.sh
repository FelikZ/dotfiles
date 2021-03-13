#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "Usage:"
    echo "./aifc_to_wav.sh 1.aifc"
fi

ffmpeg -i "$1" -map_channel 0.0.0 -c:a pcm_s24le "${1%.aiff}.wav"
read -p "Press enter to continue"
read -p "Press enter to continue"
