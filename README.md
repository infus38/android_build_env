## lk2nd build environment
This repository provides you with a minimal containerized environment to build lk2nd. It embeds the required tools to build the project. However, please note that you'll need to mount the source code onto the container as it is not provided by the container image. \

_**Required tool**: your prefered OCI container manager (podman, docker, ...)_

### Building the image
```sh
podman build <path-to-the-Dockerfile> -t <image-name>
```
> Note: `-t` naming your image is optional 

### Using the image
```sh
podman run --rm  -v <path-to-lk2nd-src>:/home/build/ <image-name/id> 
```
> Note: `-e TOOLCHAIN_PREFIX=arm-none-eabi- -e TARGET=lk2nd-msm8226` If needed, adjust the TOOLCHAIN_PREFIX and TARGET environment variables to suit your needs.
