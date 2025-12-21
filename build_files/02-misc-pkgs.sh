#!/bin/bash
# commands for installing misc packages (AUR, Chaotic AUR, bootc)

echo "::group::Install misc packages"

### normal AUR (AUR packages not packaged in Chaotic AUR)

# setup user
useradd -m -G wheel builder
echo "builder:1234" | chpasswd
echo "%wheel ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/10-installer

# build yay
su - builder -c "git clone https://aur.archlinux.org/yay.git ~/yay && \
                cd ~/yay && \
                makepkg -si --noconfirm"

# install aur pkgs
su - builder -c "yay -S --noconfirm hypryou hypryou-greeter warehouse-git devpod"

# cleanup
rm /etc/sudoers.d/10-installer
pkill -u builder
userdel -r builder

### Chaotic AUR / bootc

set -euo pipefail

# setup Chaotic AUR
pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
pacman-key --init && pacman-key --lsign-key 3056513887B78AEB
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' --noconfirm
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' --noconfirm
echo -e '[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist' >> /etc/pacman.conf

# setup Heck's bootc repo
pacman-key --recv-key 5DE6BF3EBC86402E7A5C5D241FA48C960F9604CB --keyserver keyserver.ubuntu.com
pacman-key --lsign-key 5DE6BF3EBC86402E7A5C5D241FA48C960F9604CB
echo -e '[bootc]\nSigLevel = Required\nServer=https://github.com/hecknt/arch-bootc-pkgs/releases/download/$repo' >> /etc/pacman.conf

pacman -Sy --noconfirm

# install Chaotic AUR / bootc packages
pacman -S --noconfirm \
    chaotic-aur/flatpak-git chaotic-aur/obs-studio-stable chaotic-aur/obs-vkcapture-git \
    chaotic-aur/ttf-symbola chaotic-aur/opentabletdriver chaotic-aur/qt6ct-kde chaotic-aur/adwaita-qt5-git \
    chaotic-aur/adwaita-qt6-git chaotic-aur/bootc chaotic-aur/ttf-twemoji chaotic-aur/vesktop chaotic-aur/bazaar-git \
    chaotic-aur/pinta chaotic-aur/gearlever chaotic-aur/vscodium bootc/uupd

echo "::endgroup::"