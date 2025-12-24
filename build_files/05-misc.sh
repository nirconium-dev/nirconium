#!/bin/bash
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

# setup starship prompt
echo 'eval "$(starship init bash)"' > /etc/profile.d/starship-init.sh

# branding stuffs
cp -f /usr/share/nirconium/pixmaps/watermark.png /usr/share/plymouth/themes/spinner/watermark.png
sed -i -f - /usr/lib/os-release <<EOF
s|^NAME=.*|NAME=\"Nirconium\"|
s|^PRETTY_NAME=.*|PRETTY_NAME=\"Nirconium\"|
s|^VERSION_CODENAME=.*|VERSION_CODENAME=\"Kyntra\"|
s|^VARIANT_ID=.*|VARIANT_ID=""|
s|^HOME_URL=.*|HOME_URL=\"https://github.com/nirconium-dev/nirconium\"|
s|^BUG_REPORT_URL=.*|BUG_REPORT_URL=\"https://github.com/nirconium-dev/nirconium/issues\"|
s|^SUPPORT_URL=.*|SUPPORT_URL=\"https://github.com/nirconium-dev/nirconium/issues\"|
s|^CPE_NAME=\".*\"|CPE_NAME=\"cpe:/o:nirconium-dev:nirconium\"|
s|^DOCUMENTATION_URL=.*|DOCUMENTATION_URL=\"https://github.com/nirconium-dev/nirconium\"|
s|^DEFAULT_HOSTNAME=.*|DEFAULT_HOSTNAME="nirconium"|

/^REDHAT_BUGZILLA_PRODUCT=/d
/^REDHAT_BUGZILLA_PRODUCT_VERSION=/d
/^REDHAT_SUPPORT_PRODUCT=/d
/^REDHAT_SUPPORT_PRODUCT_VERSION=/d
EOF

echo "::endgroup::"