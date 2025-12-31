#!/bin/sh
# miscellaneous stuff

echo "::group::===========================> Miscellaneous tasks"

set -ouex pipefail

# manually add greetd user due to rebase issues
useradd -M -G video,input -s /usr/bin/nologin greeter || true

# enable ntsync
echo -e 'ntsync' > /etc/modules-load.d/ntsync.conf

# enable bbr3
echo -e 'net.core.default_qdisc=fq
net.ipv4.tcp_congestion_control=bbr' > /etc/sysctl.d/99-bbr3.conf

# setup zram
echo -e '[zram0]\nzram-size = min(ram, 8192)' > /usr/lib/systemd/zram-generator.conf
echo -e 'enable systemd-resolved.service' > /usr/lib/systemd/system-preset/91-resolved-default.preset
echo -e 'L /etc/resolv.conf - - - - ../run/systemd/resolve/stub-resolv.conf' > /usr/lib/tmpfiles.d/resolved-default.conf
systemctl preset systemd-resolved.service

# refresh font cache
fc-cache --force --really-force --system-only --verbose

# setup oh-my-posh prompt
echo 'eval "$(oh-my-posh init bash)"' >> /etc/bash.bashrc

# install Cherries
git clone "https://github.com/tartaria-dev/cherries.git" /usr/share/tartaria/cherries
install -d /etc/niri/
cp -f /usr/share/tartaria/cherries/dot_config/niri/config.kdl /etc/niri/config.kdl

# make Maple Mono default Foot font
sed -i 's/^# font=monospace:size=11/font=Maple Mono:size=11/' /etc/xdg/foot/foot.ini

# fix Foot terminal not using login-shell
sed -i 's/^# login-shell=no/login-shell=yes/' /etc/xdg/foot/foot.ini

# set up environment variables
echo -e "
QT_QPA_PLATFORM=\"wayland;xcb\"
QT_WAYLAND_DISABLE_WINDOWDECORATION=\"1\"
QT_AUTO_SCREEN_SCALE_FACTOR=\"1\"
QT_QPA_PLATFORMTHEME=\"qt6ct\"

MOZ_ENABLE_WAYLAND=\"1\"
GDK_SCALE=\"1\"
SDL_VIDEODRIVER=\"wayland\"

ELECTRON_ENABLE_WAYLAND=\"1\"
ELECTRON_OZONE_PLATFORM_HINT=\"wayland\"" >> /etc/environment

# apply bootscreen logo
cp -f /usr/share/tartaria/pixmaps/watermark.png /usr/share/plymouth/themes/spinner/watermark.png

echo "::endgroup::"
