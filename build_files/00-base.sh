#!/bin/sh
# configure base

mkdir /usr/lib/sysimage/lib/pacmanlocal -p

pacman -Syu --noconfirm
pacman -Sy --noconfirm base dracut linux linux-firmware ostree btrfs-progs e2fsprogs xfsprogs dosfstools skopeo dbus dbus-glib glib2 ostree shadow && pacman -S --clean --noconfirm
pacman -S --noconfirm reflector bash bash-completion