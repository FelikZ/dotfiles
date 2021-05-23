#!/usr/bin/env bash
set -ex
ffmpeg \
    -y \
    -i "$1" \
    -b:v 15000k \
    -c:v libx265 \
    -f mp4 \
    -tune grain \
    -preset faster \
    -profile:v main \
    -pix_fmt yuv420p \
    -an \
    -x265-params pass=1 \
    -f null /dev/null

ffmpeg \
    -y \
    -i "$1" \
    -b:v 15000k \
    -c:v libx265 \
    -f mp4 \
    -tune grain \
    -preset faster \
    -profile:v main \
    -pix_fmt yuv420p \
    -c:a aac \
    -b:a 256k \
    -tag:v hvc1 \
    -x265-params pass=2 \
    Render.mp4
