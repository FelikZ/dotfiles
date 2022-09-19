#!/usr/bin/env bash

HOW_LONG="${1:-3600}"

sleep "${HOW_LONG}"
kill $(ps aux | grep caffeinate | tail -1 | awk '{print $2}')
shutdown -s now
