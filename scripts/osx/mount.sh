#!/bin/bash -x
sudo mkdir -p /Volumes/Work
sudo chown felikz /Volumes/Work
encfs /Users/felikz/Dropbox/Work /Volumes/Work
chmod -R 0700 /Volumes/Work/Secure/.ssh/
find /Volumes/Work/Secure/.ssh -type d | xargs chmod +x
unlink ~/.ssh 2>/dev/null || true
rmdir ~/.ssh 2>/dev/null || true
ln -sf /Volumes/Work/Secure/.ssh ~
