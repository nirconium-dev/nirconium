FROM scratch AS ctx
COPY build_files /

FROM docker.io/cachyos/cachyos-v3:latest
COPY system_files /

ENV DRACUT_NO_XATTR=1

# Run build scripts
RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    sh /ctx/00-base.sh && \
    bash /ctx/01-main-pkgs.sh && \
    bash /ctx/02-misc-pkgs.sh && \
    bash /ctx/03-brew.sh && \
    bash /ctx/04-systemd.sh && \
    bash /ctx/05-misc.sh && \
    bash /ctx/99-final.sh

RUN bootc container lint
