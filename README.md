# NodeJS 16 ![Continous Integration](https://github.com/KTH/kth-nodejs-16/actions/workflows/main.yml/badge.svg)

## What versions are installed?
*Npm* and *Yarn* versions are always the latest availible at build time.

Each built image has information about its version in a file called `KTH_NODEJS`. To look into this files content run: `docker run kthse/kth-nodejs:16.0.0 cat /KTH_NODEJS`.

```bash
IMAGE INFORMATION
Based on:  node:16-alpine 
Build date: Sun Jun 20 23:18:18 UTC 2021
Node: v16.3.0
NPM: 7.15.1
Yarn: 1.22.5

--- Default global packages ---
/usr/local/lib
+-- merge-descriptors@1.0.1
`-- npm@7.15.1
```

## What tag (version) should I use?
We recommended that you use the SemVer without hash (kth-nodejs:*16.0.0*). Unlike normal images SemVer numbers are reused when we rebuild the image each night to get the latest security patches. Very seldon if ever we update the minor version (16.X.0). If you wish to stick to a specific commit you can also look in the [Docker Hub for a specifc version](https://hub.docker.com/r/kthse/kth-nodejs/tags/) where you whould see something like `16.0.0_7cf8e98`, where _7cf8e98_ is the the Git commit hash. Then you will be sure exacly what it is you are useing. But please Note, if you use a specific tag like 16.0.0_7cf8e98 you will only get nightly security upgrades aslong as the Git commit is also the Git HEAD. After that the image will slowly rotten.

## What operating system does this image use?
The image also contains build information from when the operating system was built. This information is located in the root in a file called `KTH_OS` run: `docker run kthse/kth-nodejs:8.11.0 cat /KTH_OS` to view your image.

```bash
Alpine version: 3.13.5
Build date: Sun Jun 20 23:18:18 UTC 2021
```

