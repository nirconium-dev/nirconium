#!/bin/sh
# commands for installing main arch packages

echo "::group::===========================> Install main packages"

set -ouex pipefail

# cli
pacman -S --noconfirm \
    bash \
    bash-completion \
    cliphist \
    curl \
    debugedit \
    distrobox \
    docker \
    fakeroot \
    fastfetch \
    foot \
    gcc \
    git \
    glibc-locales \
    go \
    jq \
    less \
    lsof \
    make \
    man-db \
    nano \
    openssh \
    patchelf \
    podman \
    powertop \
    python3 \
    sudo \
    sysprof \
    tar \
    tree \
    tuned \
    tuned-ppd \
    udev \
    unzip \
    usbutils \
    vim \
    wget \
    wl-clip-persist \
    yt-dlp

# filesystems
pacman -S --noconfirm \
    exfatprogs \
    f2fs-tools \
    gpart \
    gparted \
    jfsutils \
    mtools \
    nilfs-utils \
    ntfs-3g \
    udftools

# drivers
pacman -S --noconfirm \
    acpid \
    amd-ucode \
    apparmor \
    ddcutil \
    efibootmgr \
    iio-sensor-proxy \
    intel-media-driver \
    intel-ucode \
    lib32-vulkan-radeon \
    libva-intel-driver \
    libva-mesa-driver \
    lm_sensors \
    mesa \
    mesa-utils \
    shim \
    vpl-gpu-rt \
    vulkan-icd-loader \
    vulkan-intel \
    vulkan-radeon \
    xf86-video-amdgpu \
    zram-generator

# pipewire
pacman -S --noconfirm \
    alsa-firmware \
    lib32-pipewire \
    linux-firmware-intel \
    pipewire \
    pipewire-audio \
    pipewire-ffado \
    pipewire-libcamera \
    pipewire-pulse \
    pipewire-zeroconf \
    sof-firmware \
    wireplumber

# network
pacman -S --noconfirm \
    firewalld \
    libmtp \
    networkmanager \
    nss-mdns \
    samba \
    smbclient \
    udiskie \
    udisks2

# bluetooth
pacman -S --noconfirm \
    bluez \
    bluez-utils

# containerization
pacman -S --noconfirm \
    distrobox \
    docker \
    podman

# media
pacman -S --noconfirm \
    ffmpeg \
    ffmpegthumbs \
    gst-libav \
    gst-plugins-bad \
    gst-plugins-base \
    gst-plugins-good \
    gst-plugins-ugly \
    libglvnd \
    librsvg \
    playerctl \
    plymouth \
    wayland-utils \
    xwayland-satellite

# fonts
pacman -S --noconfirm \
    gnu-free-fonts \
    gsfonts \
    noto-fonts \
    noto-fonts-cjk \
    noto-fonts-emoji \
    noto-fonts-extra \
    otf-font-awesome \
    otf-monaspace \
    ttf-arphic-uming \
    ttf-baekmuk \
    ttf-croscore \
    ttf-dejavu \
    ttf-droid \
    ttf-fira-code \
    ttf-firacode-nerd \
    ttf-ibm-plex \
    ttf-nerd-fonts-symbols \
    ttf-nerd-fonts-symbols-common \
    ttf-nerd-fonts-symbols-mono \
    unicode-emoji \
    wqy-microhei

# interface
pacman -S --noconfirm \
    accountsservice \
    archlinux-xdg-menu \
    brightnessctl \
    cava \
    dgop \
    evolution-data-server \
    glycin \
    greetd \
    niri \
    papirus-icon-theme \
    polkit-gnome \
    quickshell \
    shared-mime-info \
    wlsunset \
    xdg-desktop-portal \
    xdg-desktop-portal-gnome \
    xdg-user-dirs \
    xdg-utils

# accessibility
pacman -S --noconfirm \
    espeak-ng \
    orca

# printer
pacman -S --noconfirm \
    cups \
    cups-browsed \
    hplip

# apps
# IMPORTANT: keep an eye on https://github.com/andyholmes/valent, extremely viable alternative to KDE Connect
pacman -S --noconfirm \
    ark \
    decibels \
    frameworkintegration \
    gnome-calculator \
    gnome-calendar \
    gnome-disk-utility \
    gnome-music \
    gnome-text-editor \
    gnome-weather \
    gpu-screen-recorder \
    impression \
    kdeconnect \
    loupe \
    mission-center \
    nautilus \
    papers \
    scx-manager \
    scx-scheds \
    secrets \
    showtime \
    zed

echo "::endgroup::"
