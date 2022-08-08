## LineageOS build environment
This repository provide you with a minimal containerized environment to build los (LineageOS). It simply embed required tools to build the project. Hence, you will need to bind mount the src onto the container which aren't sync during the build process of the container image.
_**required tool**: your prefered OCI container manager (podman, docker, ...)_

### Building the image
```sh
podman build <path-to-the-Dockerfile> -t <image-name>
```
> Note: `-t` naming your image is optional 

### Using the image
```sh
podman run -v <path-to-los-src>:</home/builder/ -it <image-name/id> /bin/bash
```
Now that you're all set up, it's time to start building !