# NodeJS 16 ![Continous Integration](https://github.com/KTH/kth-nodejs-16/actions/workflows/main.yml/badge.svg)


## Versions 
Different versions can be found in its own Git branch. The branch name tells you what base version is used. This version is also semi-hardcoded into the Dockerfile:s `apk add nodejs` command. The maintaind branches are build every night to have the latest security patches installed. After being built the image is pushed to [KTH:s public account on Docker Hub](https://hub.docker.com/r/kthse/kth-nodejs/tags/).

## Build and publishing
Each branch builds and publishes to [Docker Hub](https://hub.docker.com/r/kthse/kth-nodejs/tags/) daily by [Jenkins](https://build.sys.kth.se/view/team-pipeline/).

## What versions are installed?
The image tag tells you what version you are using so `kth-nodejs:8.11.* is NodeJS version 8.11*` and `kth-nodejs:10.1.* is Node version 10` and so on.

*Npm* and *Yarn* versions are always the latest availible.

Each built image has information about its version in a file called `KTH_NODEJS`. To look into this files content run: `docker run kthse/kth-nodejs:8.11.0 cat /KTH_NODEJS`.

```bash
IMAGE INFORMATION
Build date: Wed Oct 10 08:42:35 UTC 2018
Node: v8.11.4
NPM: 6.4.1
Yarn: 1.7.0
```

## What tag (version) should i use?
We recommended that you use the SemVer without hash (kth-nodejs:*8.11.0*), and try to keep up with possible upgrades to major, minor or patch-version. Unlike normal images SemVer numbers are reused when we rebuild the image each night to get the latest security patches. If you wish to stick to a specific commit you can also look in the [Docker Hub for a specifc version](https://hub.docker.com/r/kthse/kth-nodejs/tags/) where you whould see something like `9.11.0_50e53e0`, where _50e53e0_ whould the the Git commit hash. Then you will be sure exacly what it is you are useing. But please Note, if you use a specific tag like 9.11.0_50e53e0 you will only get nightly security upgrades aslong as the Git commit is also the Git HEAD. After that the image will slowly rotten.

## What operating system does this image use?
The image also contains build information from when the operating system was built. This information is located in the root in a file called `KTH_OS` run: `docker run kthse/kth-nodejs:8.11.0 cat /KTH_OS` to view your image.

```bash
IMAGE INFORMATION
Build date: Wed Oct 10 08:45:39 UTC 2018
Alpine version: 3.8.1
```

