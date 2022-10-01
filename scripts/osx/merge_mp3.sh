#!/usr/bin/env bash

if [ -f "./output.mp3" ]; then
    rm output.mp3
fi

find . -type f -name "*.mp3" -print0 | xargs -0r stat -f "file '%N'" | sort -V >list.txt
ffmpeg -f concat -safe 0 -i list.txt -c copy output.mp3
