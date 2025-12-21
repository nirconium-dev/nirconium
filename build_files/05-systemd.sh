#!/bin/bash
# configure important system services

set -euo pipefail
echo "::group:: Configure systemd services"

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
    cups-browsed.service \
    brew-setup.service \
    uupd.timer

# user
systemctl --global enable \
    wl-clip-persist.service \
    udiskie.service \
    opentabletdriver.service

echo "::endgroup::"