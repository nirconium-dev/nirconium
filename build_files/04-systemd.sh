#!/bin/bash
# configure important system services

echo "::group::===========================> Configure systemd services"

set -ouex pipefail

# system
systemctl enable polkit.service \
    NetworkManager.service \
    tuned.service \
    tuned-ppd.service \
    firewalld.service \
    greetd.service \
    rechunker-group-fix.service \
    flatpak-preinstall.service \
    cups.socket \
    cups-browsed.service \
    brew-setup.service \
    bluetooth.service \
    uupd.timer

# user
systemctl --global enable \
    wl-clip-persist.service \
    udiskie.service \
    opentabletdriver.service

echo "::endgroup::"