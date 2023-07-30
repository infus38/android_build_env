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
podman run -e TARGET=<your_device_codename> -v <path-to-los-src>:<somewhere-in-the-container> -it <image-name/id>
```
> Note: you set your own nb of jobs using the `JOBS_NUMBER` env var

Now that you're all set up, it's time to start building !

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