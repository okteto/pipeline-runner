# syntax = docker/dockerfile:experimental
FROM debian:bookworm-slim AS base

RUN apt clean && apt update && \
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

RUN git config --global http.timeout 300 && \
    git config --global http.lowSpeedLimit 1000 && \
    git config --global http.lowSpeedTime 30 && \
    git config --global core.sshCommand "ssh -o ConnectTimeout=300 -o ServerAliveInterval=60 -o ServerAliveCountMax=3 -o TCPKeepAlive=yes"

FROM base as rootless

RUN addgroup --gid 1000 runner && \
    adduser --disabled-login --home /home/runner --ingroup runner --uid 1000 runner

USER 1000

WORKDIR /okteto/src

# keep basic container image build rootful as before
FROM base as rootful

WORKDIR /okteto/src
