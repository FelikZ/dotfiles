#!/usr/bin/env bash

docker run -it -v $(pwd)/docker/config:/config -v "$(pwd)/docker/download:/app/ZSpotify Podcasts" jsavargas/zspotify
