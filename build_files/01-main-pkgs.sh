#!/bin/bash
# commands for installing main arch packages

echo "::group::Install main packages"

set -euo pipefail
set +x

# media
pacman -S --noconfirm librsvg libglvnd qt6-multimedia-ffmpeg plymouth acpid ddcutil dmidecode \
    mesa-utils vulkan-tools wayland-utils playerctl

# fonts
pacman -S --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji unicode-emoji noto-fonts-extra \
    ttf-ibm-plex otf-font-awesome ttf-jetbrains-mono wqy-microhei ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common \
    ttf-nerd-fonts-symbols-mono ttf-croscore ttf-dejavu ttf-droid gsfonts ttf-arphic-uming ttf-baekmuk gnu-free-fonts \
    otf-monaspace

# bluetooth
pacman -S --noconfirm bluez bluez-utils

# cli
pacman -S --noconfirm sudo fastfetch btop jq less lsof nano openssh powertop man-db wget yt-dlp fakeroot debugedit go make \
    gcc tree usbutils vim wl-clip-persist cliphist unzip ptyxis glibc-locales tar udev starship tuned-ppd tuned hyfetch \
    curl patchelf git

# containerization
pacman -S --noconfirm distrobox podman

# drivers
pacman -S --noconfirm amd-ucode intel-ucode efibootmgr shim mesa libva-intel-driver libva-mesa-driver vpl-gpu-rt \
    vulkan-icd-loader vulkan-intel vulkan-radeon apparmor xf86-video-amdgpu lib32-vulkan-radeon zram-generator lm_sensors

# network
pacman -S --noconfirm libmtp nss-mdns samba smbclient networkmanager firewalld udiskie udisks2

# accessibility
pacman -S --noconfirm espeak-ng orca

# pipewire
pacman -S --noconfirm pipewire pipewire-pulse pipewire-zeroconf pipewire-ffado pipewire-libcamera sof-firmware wireplumber \
    alsa-firmware lib32-pipewire pipewire-audio linux-firmware-intel

# printer
pacman -S --noconfirm cups cups-browsed hplip

# filesystems
pacman -S --noconfirm gpart exfatprogs f2fs-tools jfsutils mtools nilfs-utils ntfs-3g udftools

# interface
pacman -S --noconfirm greetd hyprland xdg-desktop-portal xdg-user-dirs xdg-desktop-portal-gnome ffmpegthumbs matugen \
    accountsservice dgop cava brightnessctl ddcutil xdg-utils archlinux-xdg-menu shared-mime-info glycin gnome-themes-extra \
    hicolor-icon-theme

# apps
pacman -S --noconfirm dolphin okular gwenview ark plasma-systemmonitor kate kdenlive frameworkintegration \
    kdeconnect krita partitionmanager kcalc haruna elisa kweather impression

echo "::endgroup::"