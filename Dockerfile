FROM debian:12.5-slim

ARG USER=user
ARG SHELL=/bin/bash

RUN useradd -N -m -s ${SHELL} ${USER} \
  && apt-get -qq -y update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -qq -y --no-install-recommends \
  git \
  openssh-client \
  tini \
  clang \
  make \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/bin/tini", "--"]

USER ${USER}
