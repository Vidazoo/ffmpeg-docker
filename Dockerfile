# this also includes an install of ffmpeg for use in the platform service
# it's offical so i'm using it, just add this dockerfile to every github repo i want to build to run in a node.js container
FROM node:4.3

# whoami
MAINTAINER naor livne <naorlivne@gmail.com>

#install ffmpeg
RUN apt-get update && apt-get install -y time yasm nasm \
                build-essential automake autoconf \
                libtool pkg-config libcurl4-openssl-dev \
                intltool libxml2-dev libgtk2.0-dev \
                libnotify-dev libglib2.0-dev libevent-dev \
                checkinstall && \
                wget https://www.ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2 &&\
                tar jxvf ffmpeg-snapshot.tar.bz2 && cd ffmpeg && \
                ./configure --prefix=/usr && time make -j 8 && mkdir /usr/share/ffmpeg && \
                checkinstall --pkgversion=3.0.git -y && dpkg --install ffmpeg_*.deb