# flatpak preinstall
echo -e '[Unit]\n\
Description=Preinstall Flatpaks\n\
After=network-online.target\n\
Wants=network-online.target\n\
ConditionPathExists=/usr/bin/flatpak\n\
Documentation=man:flatpak-preinstall(1)\n\
\n\
[Service]\n\
Type=oneshot\n\
ExecStart=/usr/bin/flatpak preinstall -y\n\
RemainAfterExit=true\n\
Restart=on-failure\n\
RestartSec=30\n\
\n\
StartLimitIntervalSec=600\n\
StartLimitBurst=3\n\
\n\
[Install]\n\
WantedBy=multi-user.target' > /usr/lib/systemd/system/flatpak-preinstall.service

echo -e '[Unit]\n\
Description=Persistent wayland clipboard\n\
\n\
[Service]\n\
ExecStart=/usr/bin/wl-clip-persist --clipboard regular\n\
\n\
[Install]\n\
WantedBy=default.target' > /usr/lib/systemd/user/wl-clip-persist.service

# This fixes a user/groups error with rebasing from other problematic images.
# FIXME Do NOT remove until fixed upstream or fixed universally. Updating with new fix also fine. Script created by Tulip.
mkdir -p /usr/lib/systemd/system-preset /usr/lib/systemd/system

echo -e '#!/bin/sh\ncat /usr/lib/sysusers.d/*.conf | grep -e "^g" | grep -v -e "^#" | awk "NF" | awk '\''{print $2}'\'' | grep -v -e "wheel" -e "root" -e "sudo" | xargs -I{} sed -i "/{}/d" $1' > /usr/libexec/nirconium-group-fix
chmod +x /usr/libexec/nirconium-group-fix
echo -e '[Unit]\n\
Description=Fix groups\n\
Wants=local-fs.target\n\
After=local-fs.target\n\
[Service]\n\
Type=oneshot\n\
ExecStart=/usr/libexec/nirconium-group-fix /etc/group\n\
ExecStart=/usr/libexec/nirconium-group-fix /etc/gshadow\n\
ExecStart=systemd-sysusers\n\
[Install]\n\
WantedBy=default.target multi-user.target' > /usr/lib/systemd/system/nirconium-group-fix.service

echo -e "enable nirconium-group-fix.service" > /usr/lib/systemd/system-preset/01-nirconium-group-fix.preset

# system
systemctl enable polkit.service \
    NetworkManager.service \
    tuned.service \
    tuned-ppd.service \
    firewalld.service \
    greetd.service \
    flatpak-preinstall.service \
    nirconium-group-fix.service \
    cups.socket \
    cups-browsed.service

# user
systemctl --global enable \
    wl-clip-persist.service