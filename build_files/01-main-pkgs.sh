#!/bin/sh
# commands for installing main arch packages

echo "::group::===========================> Install main packages"

set -ouex pipefail

# media
pacman -S --noconfirm librsvg libglvnd plymouth acpid ddcutil dmidecode mesa-utils ffmpeg vulkan-tools wayland-utils \
    playerctl gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly xwayland-satellite

# fonts
pacman -S --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji unicode-emoji noto-fonts-extra \
    ttf-ibm-plex otf-font-awesome ttf-fira-code ttf-firacode-nerd wqy-microhei ttf-nerd-fonts-symbols \
    ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols-mono ttf-croscore ttf-dejavu ttf-droid gsfonts \
    ttf-arphic-uming ttf-baekmuk gnu-free-fonts otf-monaspace

# bluetooth
pacman -S --noconfirm bluez bluez-utils

# cli
pacman -S --noconfirm sudo fastfetch jq less lsof nano openssh powertop man-db wget yt-dlp fakeroot debugedit go make \
    gcc tree usbutils vim wl-clip-persist cliphist unzip foot glibc-locales tar udev tuned-ppd tuned patchelf git curl \
    bash bash-completion chezmoi

# containerization
pacman -S --noconfirm distrobox podman docker

# drivers
pacman -S --noconfirm iio-sensor-proxy amd-ucode intel-ucode efibootmgr shim mesa libva-intel-driver libva-mesa-driver vpl-gpu-rt \
    vulkan-icd-loader vulkan-intel vulkan-radeon apparmor xf86-video-amdgpu lib32-vulkan-radeon zram-generator lm_sensors \
    intel-media-driver

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
pacman -S --noconfirm greetd niri xdg-desktop-portal xdg-user-dirs xdg-desktop-portal-gnome ffmpegthumbs \
    accountsservice dgop cava brightnessctl ddcutil xdg-utils shared-mime-info glycin papirus-icon-theme \
    archlinux-xdg-menu swww gnome-bluetooth-3.0 adw-gtk-theme dart-sass

# apps
# IMPORTANT: keep an eye on https://github.com/andyholmes/valent, extremely viable alternative to KDE Connect
pacman -S --noconfirm nautilus papers loupe ark mission-center gnome-text-editor gnome-calendar frameworkintegration zed \
    kdeconnect gnome-disk-utility gparted gnome-calculator showtime gnome-music gnome-weather impression decibels secrets \
    sysprof

echo "::endgroup::"
