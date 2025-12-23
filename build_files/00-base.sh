#!/bin/sh
# prepare base image, DO NOT MODIFY

echo "::group::Prepare image build"

# Move everything from `/var` to `/usr/lib/sysimage` so behavior around pacman remains the same on `bootc usroverlay`'d systems
grep "= */var" /etc/pacman.conf | sed "/= *\/var/s/.*=// ; s/ //" | xargs -n1 sh -c 'mkdir -p "/usr/lib/sysimage/$(dirname $(echo $1 | sed "s@/var/@@"))" && mv -v "$1" "/usr/lib/sysimage/$(echo "$1" | sed "s@/var/@@")"' '' && \
    sed -i -e "/= *\/var/ s/^#//" -e "s@= */var@= /usr/lib/sysimage@g" -e "/DownloadUser/d" /etc/pacman.conf

# FIXME | Fix an issue with Cachy's docker, pacman -syu fails otherwise https://discuss.cachyos.org/t/cant-update-because-of-linux-firmware-notice/19835
mkdir /usr/lib/sysimage/lib/pacmanlocal -p

# initialize database, install base packages, and install bash + arch mirrorlist
pacman -Syu --noconfirm
pacman -Sy --noconfirm base dracut linux linux-firmware ostree btrfs-progs e2fsprogs xfsprogs dosfstools skopeo dbus dbus-glib glib2 ostree shadow && pacman -S --clean --noconfirm
pacman -S --noconfirm reflector bash bash-completion

echo "::endgroup::"
