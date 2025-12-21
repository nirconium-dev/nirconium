#!/bin/bash
# configure brew package manager, may switch soon though

echo "::group:: Install and configure Brew"

curl -s --variable '%AUTH_HEADER' --expand-header '{{AUTH_HEADER}}' https://api.github.com/repos/ublue-os/packages/releases/latest \
    | jq -r '.assets[] | select(.name | test("homebrew-x86_64.*\\.tar\\.zst")) | .browser_download_url' \
    | xargs -I {} wget -O /usr/share/homebrew.tar.zst {}

echo '[[ -d /home/linuxbrew/.linuxbrew && $- == *i* ]] && \
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' > /etc/profile.d/brew.sh

echo "::endgroup::"