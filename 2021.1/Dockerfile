FROM ubuntu:18.04

ARG UID=1000
ARG GID=1000

ENV TZ=America/Montreal
ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 \
 && apt-get -y update \
 && apt-get -y upgrade \
 && apt-get -y install tofrodos iproute2 gawk xvfb git make net-tools libncurses5-dev tftpd \
 zlib1g:i386 libssl-dev flex bison libselinux1 gnupg wget diffstat chrpath socat xterm \
 autoconf libtool libtool-bin tar unzip texinfo gcc-multilib build-essential libsdl1.2-dev \
 libglib2.0-dev screen pax gzip sudo expect locales lsb-release cpio libgtk2.0 bc vim rsync \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && echo "dash dash/sh boolean false" | debconf-set-selections \
 && dpkg-reconfigure dash \
 && locale-gen en_US.UTF-8 \
 && update-locale

ENV INSTALLER=petalinux-v2021.1-final-installer.run
WORKDIR /installer/
COPY "files/accept-eula.sh" /installer 
COPY "files/${INSTALLER}" /installer

RUN groupadd -g "${GID}" petalinux \
 && useradd -m petalinux -g "${GID}" -u "${UID}" -s /bin/bash \
 && mkdir -p /petalinux \
 && chown -Rv petalinux:petalinux /installer /petalinux \
 && chmod +x ./* \
 && sudo -u petalinux ./accept-eula.sh "./${INSTALLER}" /petalinux \
 && cd / \
 && rm -rf /installer /tmp/*

WORKDIR /data
ENV LANG=en_US.UTF-8
USER petalinux
