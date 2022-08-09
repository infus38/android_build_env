## LineageOS build environment
This repository provide you with a minimal containerized environment to build los (LineageOS). It simply embed required tools to build the project. Hence, you will need to bind mount the src onto the container which aren't sync during the build process of the container image. \
_**Required tool**: your prefered OCI container manager (podman, docker, ...)_

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

### Fixing symlinks issues with bind mounted volume (podman 4.1.1)
__ls: cannot access ‘some_directory': Timer expired__ > This is due to some security model breaking symlinks. To fix that, simply switch from mapped-xattr to none in `~/.config/containers/podman/machine/qemu/podman-machine-default.json` once you initialized the podman machine