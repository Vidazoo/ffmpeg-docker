#base install of ffmpeg, using node as the base for the files that will pull from this one
FROM node:4.3

# whoami
MAINTAINER naor livne <naorlivne@gmail.com>

#install ffmpeg
RUN apt-get update && apt-get install -y time yasm nasm \
                automake autoconf  pkg-config libcurl4-openssl-dev \
                libxml2-dev libgtk2.0-dev \libnotify-dev libglib2.0-dev libevent-dev \
                checkinstall &&  apt-get install -y build-essential  libtool intltool \ 
                && wget https://www.ffmpeg.org/releases/ffmpeg-3.0.tar.bz2 &&\
                tar jxvf ffmpeg-3.0.tar.bz2 && cd ffmpeg && \
                ./configure --prefix=/usr && time make -j 8 && mkdir /usr/share/ffmpeg && \
                checkinstall --pkgversion=3.0.git -y && dpkg --install ffmpeg_*.deb