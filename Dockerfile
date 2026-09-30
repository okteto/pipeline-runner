# syntax = docker/dockerfile:experimental
FROM debian:13.7-slim@sha256:a99cfc517144bc59b1978475ec53b46ecabec7e43635402ee5b77cc54cd1b20a AS base

RUN apt clean && apt update && \
    apt -y upgrade && \
    apt -y install --no-install-recommends \
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
        netcat-traditional && \
    rm -f /etc/ssh/ssh_host_* && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/*

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
