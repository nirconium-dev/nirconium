# init
pacman -Syu --noconfirm

# base pkgs
pacman -Sy --noconfirm base dracut linux linux-firmware ostree btrfs-progs e2fsprogs xfsprogs dosfstools skopeo dbus dbus-glib glib2 ostree shadow && pacman -S --clean --noconfirm

# media
pacman -S --noconfirm librsvg libglvnd qt6-multimedia-ffmpeg plymouth acpid ddcutil dmidecode mesa-utils ntfs-3g \
    vulkan-tools wayland-utils playerctl

# fonts
pacman -S --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji unicode-emoji noto-fonts-extra \
    ttf-ibm-plex otf-font-awesome ttf-jetbrains-mono wqy-microhei ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common \
    ttf-nerd-fonts-symbols-mono ttf-croscore ttf-dejavu ttf-droid gsfonts ttf-arphic-uming ttf-baekmuk gnu-free-fonts otf-monaspace

# cli
pacman -S --noconfirm sudo bash bash-completion fastfetch btop jq less lsof nano openssh powertop man-db wget yt-dlp \
    tree usbutils vim wl-clip-persist cliphist unzip ptyxis glibc-locales tar udev starship tuned-ppd tuned hyfetch curl patchelf git

# containerization
pacman -S --noconfirm distrobox docker podman

# drivers
pacman -S --noconfirm amd-ucode intel-ucode efibootmgr shim mesa libva-intel-driver libva-mesa-driver \
    vpl-gpu-rt vulkan-icd-loader vulkan-intel vulkan-radeon apparmor xf86-video-amdgpu lib32-vulkan-radeon zram-generator \
    lm_sensors

# network
pacman -S --noconfirm libmtp nss-mdns samba smbclient networkmanager firewalld udiskie udisks2

# accessibility
pacman -S --noconfirm espeak-ng orca

# pipewire
pacman -S --noconfirm pipewire pipewire-pulse pipewire-zeroconf pipewire-ffado pipewire-libcamera sof-firmware wireplumber \
    alsa-firmware lib32-pipewire pipewire-audio linux-firmware-intel

# printer
pacman -S --noconfirm cups cups-browsed hplip

# desktop
pacman -S --noconfirm greetd xwayland-satellite xdg-desktop-portal-kde xdg-desktop-portal xdg-user-dirs xdg-desktop-portal-gnome \
    ffmpegthumbs kdegraphics-thumbnailers kdenetwork-filesharing kio-admin matugen accountsservice hyprland dgop cava dolphin \
    breeze brightnessctl ddcutil xdg-utils kservice5 archlinux-xdg-menu shared-mime-info kio glycin greetd-regreet gnome-themes-extra

# hypryou
git clone https://github.com/koeqaife/hyprland-material-you
cd hyprland-material-you
makepkg -si
cd greeter
makepkg -si
cd ../hypryou-utils
makepkg -si
cd ../..
rm -rf hyprland-material-you