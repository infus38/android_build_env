## AOSP build environment
This repository provides you with a minimal containerized environment to build AOSP (Android Open Source Project). It embeds the required tools to build the project. However, please note that you will need to obtain a copy of JDK 7 before building the image. Please refer to the Dockerfile for further information on how to include JDK 7 in the environment.

Additionally, you'll need to mount the source code onto the container as it is not provided by the container image. \

_**Required tool**: your prefered OCI container manager (podman, docker, ...)_

### Building the image
```sh
podman build <path-to-the-Dockerfile> -t <image-name>
```
> Note: `-t` naming your image is optional 

### Using the image
```sh
podman run -v <path-to-los-src>:<somewhere-in-the-container> -it <image-name/id> /bin/bash
```
Now that you're all set up, it's time to start building !