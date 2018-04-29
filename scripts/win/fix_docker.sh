#!/bin/bash
# Workaround for Docker for Windows in Git Bash.
docker()
{
        (export MSYS_NO_PATHCONV=1; "docker.exe" "$@")
}