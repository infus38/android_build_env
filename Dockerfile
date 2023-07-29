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
	git \
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
	openjdk-8-jdk \
	python \
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

# Address the deprecation of TLSv1 and TLSv1.1 to resolve the Jack 
# server SSL issue during the build. 
RUN perl -0777 -i -p -e 's/(jdk.tls.disabledAlgorithms=.*?), TLSv1, TLSv1\.1/$1/g' \
	/etc/java-8-openjdk/security/java.security 

# Required for the Jack server; the ability to edit those params will be available soon.
ENV USER=root
ENV ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"