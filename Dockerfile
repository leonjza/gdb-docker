FROM debian:bookworm-slim

LABEL maintainer="@leonjza"

RUN apt update && \
    apt install -y \
        curl procps locales \
        python3-minimal python3-pip gdb binutils file \
    && \
    apt clean && \
    curl -fsSL http://gef.blah.cat/sh | sh

# locale config
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# gef deps
RUN pip install pwntools keystone-engine unicorn capstone ropper

VOLUME /data

