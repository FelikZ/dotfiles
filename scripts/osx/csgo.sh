#!/usr/bin/env bash

sudo renice -20 "$(ps x | grep csgo_osx64 | head -1 | awk '{print $1}')"
