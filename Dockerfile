FROM fedora:38

# update the package lists prior any further install 
RUN dnf update -y

# Set the default and required environment variables
ENV TOOLCHAIN_PREFIX=arm-none-eabi-
ENV TARGET=lk2nd-msm8226

# install needed package to build lk2nd
RUN dnf install -y arm-none-eabi-gcc-cs \
    libfdt-devel \
    make \
    cpp \
    g++ \
    dtc

WORKDIR /home/build/
CMD ["sh", "-c", "make TOOLCHAIN_PREFIX=${TOOLCHAIN_PREFIX} ${TARGET}"]