FROM alpine:3.18.0

RUN apk --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing add cue-cli

RUN apk --no-cache add \
    yq \
    sudo \
    ca-certificates \
    gnupg \
    bash \
    make \
    git \
    openssh-server \
    curl \
    gettext \
    jq \
    netcat-openbsd

RUN curl https://raw.githubusercontent.com/vishnubob/wait-for-it/81b1373f17855a4dc21156cfe1694c31d7d1792e/wait-for-it.sh -o /usr/bin/wait-for-it && chmod +x /usr/bin/wait-for-it
