#!/bin/bash -x
sudo mkdir -p /Volumes/Work
sudo chown felikz /Volumes/Work
encfs /Users/felikz/Dropbox/Work /Volumes/Work
chmod -R 0700 /Volumes/Work/Secure/.ssh/
find /Volumes/Work/Secure/.ssh -type d | xargs chmod +x
unlink ~/.ssh || true
rmdir ~/.ssh || true
ln -sf /Volumes/Work/Secure/.ssh ~
