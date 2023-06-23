# syntax = docker/dockerfile:experimental
FROM debian:bookworm-slim

COPY --from=cuelang/cue:0.5.0 /usr/bin/cue /usr/local/bin/cue
COPY --from=mikefarah/yq:4 /usr/bin/yq /usr/local/bin/yq

RUN apt update && apt clean && \
    apt -y install \
        sudo \
        apt-transport-https \
        ca-certificates \
        gnupg \
        bash \
        make \
        git \
        openssh-server \
        curl \
        gettext-base \
        wait-for-it \
        jq \
        netcat-traditional
