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
> Note: `-e TOOLCHAIN_PREFIX=arm-none-eabi- -e TARGET=lk2nd-msm8226` Already specified in dockerfile. If needed, adjust those environment variables to suit your needs.

### Fixing "too many open files" issues with bind mounted volume (podman 4.5.1)
On macOS, check for your maximum stack size using the following command:
```sh
sysctl kern.stack_size
```
and set it accordingly, using the 'ulimit' utility.
```sh 
ulimit -s 16384
```
> Note: `16384` is for reference 