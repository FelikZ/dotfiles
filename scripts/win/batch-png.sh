#!/usr/bin/env bash

cd "$1"
mkdir -p "out"
find . -maxdepth 1 -name "*.png" -print0 | xargs -0 -I{} -P 8 pngcrush -rem gAMA -rem cHRM -rem iCCP -rem sRGB {} "out/{}.min.png"
