#!/usr/bin/env bash

cd "$1"
mkdir -p "out"
find . -maxdepth 1 -name "*.tif" | sed 's/\.tif$//' | xargs -I{} -P 8 ffmpeg -y -i "{}.tif" "out/{}.full.png"

cd out
find . -maxdepth 1 -name "*.full.png" | sed 's/\.full\.png$//' | xargs -I{} -P 8 pngcrush -rem gAMA -rem cHRM -rem iCCP -rem sRGB "{}.full.png" "{}.png"

rm -f *.full.png
