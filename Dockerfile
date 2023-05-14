FROM ubuntu:16.04
USER root 

# configure tzdata to avoid process hanging on data input during build 
RUN ln -snf /usr/share/zoneinfo/Europe/Paris /etc/localtime && echo Europe/Paris > /etc/timezone

# update the package lists prior any further install 
RUN apt-get update -y 

# Install JDK 7 by adding the JDK archive to the image.
# Please obtain your own JDK archive from the Oracle Java SE 7 Archive Downloads page:
# https://www.oracle.com/java/technologies/javase/javase7-archive-downloads.html
ADD jdk-7u80-linux-x64.tar.gz /usr/local/java/

# Set the environment variables to point to the JDK installation directory.
ENV JAVA_HOME=/usr/local/java/jdk1.7.0_80
ENV JRE_HOME=/usr/local/java/jdk1.7.0_80
ENV PATH=$PATH:$JRE_HOME/bin:$JAVA_HOME/bin

# install needed package to build LineageOS
RUN apt-get install -y bison \
    g++-multilib \
    git \
    gperf \
    libxml2-utils \
    make \
    zlib1g-dev \
    zip \
    repo