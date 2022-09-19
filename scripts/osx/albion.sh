#!/usr/bin/env bash
sudo renice -20 "$(ps x | grep albion | head -1 | awk '{print $1}')"
