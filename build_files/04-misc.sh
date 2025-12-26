#!/bin/sh
# miscellaneous stuff

echo "::group::===========================> Miscellaneous tasks"

set -ouex pipefail

# set Darkly as default Qt theme
echo "QT_STYLE_OVERRIDE=Darkly" | tee -a /etc/environment

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

# make firacode-nerd default Foot font
sed -i 's/^# font=monospace:size=11/font=FiraCode Nerd Font:size=11/' /etc/xdg/foot/foot.ini

# set default wallpaper
cp -f /usr/share/tartaria/wallpapers/default_wallpaper.jpg /usr/share/hypryou/default_wallpaper.jpg

# apply bootscreen logo
cp -f /usr/share/tartaria/pixmaps/watermark.png /usr/share/plymouth/themes/spinner/watermark.png

echo "::endgroup::"
