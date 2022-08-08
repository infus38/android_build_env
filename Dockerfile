FROM ubuntu:20.04

USER root 

# configure tzdata to avoid process hanging on data input during build 
RUN ln -snf /usr/share/zoneinfo/Europe/Paris /etc/localtime && echo Europe/Paris > /etc/timezone

# update the package lists prior any further install 
RUN apt-get update -y 

# install needed package to build LineageOS
RUN apt-get install -y bc \
	bison \
	build-essential \
	ccache \
	curl \
	flex \
	g++-multilib \
	gcc-multilib \
	gnupg \
	gperf \
	imagemagick \
	lib32ncurses5-dev \
	lib32readline-dev \
	lib32z1-dev \
	liblz4-tool \
	libncurses5 \
	libncurses5-dev \
	libsdl1.2-dev \
	libssl-dev \
	libxml2 \
	libxml2-utils \
	lzop \
	pngcrush \
	rsync \
	schedtool \
	squashfs-tools \
	xsltproc \
	zip \
	zlib1g-dev 