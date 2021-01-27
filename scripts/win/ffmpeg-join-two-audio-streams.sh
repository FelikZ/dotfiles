#!/usr/bin/env bash

echo ffmpeg -i $1 -i $2 \
    -filter_complex amix=inputs=2:duration=longest \
    -b:a 256k \
    output.m4a
