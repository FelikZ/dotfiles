#!/usr/bin/env bash
# run with sudo

rm /private/etc/nsmb.conf
rm /etc/nsmb.conf
cp nsmb.conf /etc/nsmb.conf
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE

# reload SMB deamon/process
launchctl kickstart -k system/com.apple.smbd # restart the SMB service without stopping and starting it separately
launchctl stop com.apple.smbd
launchctl start com.apple.smbd

# restart SMB service
launchctl unload -w /System/Library/LaunchDaemons/com.apple.smbd.plist # stop the SMB service
launchctl load -w /System/Library/LaunchDaemons/com.apple.smbd.plist   # start the SMB service

echo xattr -d com.apple.metadata:_kMDItemUserTags /Volumes/TimeMachineBackup
echo xattr -d purgeable-drecs-fixed /Volumes/TimeMachineBackup
echo xattr -d com.apple.FinderInfo /Volumes/TimeMachineBackup
