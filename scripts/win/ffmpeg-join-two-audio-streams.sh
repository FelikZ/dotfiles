#!/usr/bin/env bash

echo ffmpeg -i $1 -i $2 \
    -filter_complex amix=inputs=2:duration=longest \
    -b:a 256k \
    output.m4a

echo "For 7.1 input1:"
echo ffmpeg -i $1 -i $2 \
    -filter_complex "[0:a:0]channelsplit=channel_layout=7.1:channels=FC[a3],[1:a:0]channelsplit=channel_layout=stereo:channels=FL[b1],[a3][b1]amix=inputs=2[a]" \
    -map "[a]" \
    -b:a 128k \
    output.m4a
