#!/usr/bin/env bash

ENCFS_MOUNT_SOURCE=${ENCFS_MOUNT_SOURCE:-"/Users/${USER}/Google Drive/Secure"}
ENCFS_MOUNT_DEST="/Volumes/Work"

ENCFS_SSH_DIR="${ENCFS_MOUNT_DEST}/.ssh"

sudo mkdir -p "${ENCFS_MOUNT_DEST}"
sudo chown "${USER}" "${ENCFS_MOUNT_DEST}"
encfs "${ENCFS_MOUNT_SOURCE}" "${ENCFS_MOUNT_DEST}"

chmod -R 0700 "${ENCFS_SSH_DIR}"
find "${ENCFS_SSH_DIR}" -type d -print0 | xargs -0 chmod +x
unlink ~/.ssh 2>/dev/null || true
rmdir ~/.ssh 2>/dev/null || true
ln -sf "${ENCFS_SSH_DIR}" ~
