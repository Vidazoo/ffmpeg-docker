#base install of ffmpeg, using node 6.9.1 as the base for the files that will pull from this one
FROM node:6.9.1

# whoami
MAINTAINER naor livne <naorlivne@gmail.com>

#install ffmpeg
RUN apt-get update  
RUN apt-get install -y time yasm nasm \
                automake autoconf  pkg-config libcurl4-openssl-dev \
                libxml2-dev libgtk2.0-dev libglib2.0-dev libevent-dev \
                checkinstall
RUN apt-get install -y libmp3lame0  libmp3lame-dev openssl
RUN apt-get install -y libnotify-dev build-essential  libtool intltool 
RUN apt-get install -y libvorbis-dev libtheora-dev libvpx-dev libx264-dev
RUN wget https://www.ffmpeg.org/releases/ffmpeg-3.0.tar.bz2 &&\
                tar jxvf ffmpeg-3.0.tar.bz2 && cd ffmpeg-3.0 && \
                ./configure --enable-openssl --enable-nonfree  --enable-libmp3lame --enable-libvorbis --enable-gpl --enable-libx264 --enable-libtheora --enable-libvpx  --prefix=/usr && time make -j 8 && mkdir /usr/share/ffmpeg && \
                checkinstall --pkgversion=3.0.git -y && dpkg --install ffmpeg_*.deb
