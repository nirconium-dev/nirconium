#!/bin/sh
# install dotfiles

echo "::group::===========================> Install cherries"

set -ouex pipefail

# add Niri wants
add_wants_niri() {
    sed -i "s/\[Unit\]/\[Unit\]\nWants=$1/" "/usr/lib/systemd/user/niri.service"
}
add_wants_niri udiskie.service
add_wants_niri foot.service

echo "::endgroup::"
