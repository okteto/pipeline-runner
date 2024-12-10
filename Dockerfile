# syntax = docker/dockerfile:experimental
FROM debian:bookworm-slim as base

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

FROM base as rootless

RUN addgroup --gid 1000 runner && \
    adduser --disabled-login --home /home/runner --ingroup runner --uid 1000 runner

USER 1000

WORKDIR /okteto/src

# keep basic container image build rootful as before
FROM base as rootful

WORKDIR /okteto/src
