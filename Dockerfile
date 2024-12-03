# syntax = docker/dockerfile:experimental
FROM debian:bookworm-slim as base

COPY --from=cuelang/cue:0.9.2 /usr/bin/cue /usr/local/bin/cue
COPY --from=mikefarah/yq:4 /usr/bin/yq /usr/local/bin/yq

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
