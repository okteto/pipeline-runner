# syntax = docker/dockerfile:experimental
FROM debian:buster-slim

COPY --from=cuelang/cue:0.4.0 /usr/bin/cue /usr/local/bin/cue
COPY --from=mikefarah/yq:4 /usr/bin/yq /usr/local/bin/yq

RUN apt update && \
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
        netcat
