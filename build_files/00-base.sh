#!/bin/sh
# prepare base image, DO NOT MODIFY

# FIXME | Fix an issue with Cachy's docker, pacman -syu fails otherwise https://discuss.cachyos.org/t/cant-update-because-of-linux-firmware-notice/19835
mkdir /usr/lib/sysimage/lib/pacmanlocal -p

# initialize database, install base packages, and install bash + arch mirrorlist
pacman -Syu --noconfirm
pacman -Sy --noconfirm base dracut linux linux-firmware ostree btrfs-progs e2fsprogs xfsprogs dosfstools skopeo dbus dbus-glib glib2 ostree shadow && pacman -S --clean --noconfirm
pacman -S --noconfirm reflector bash bash-completion

echo "::endgroup::"
