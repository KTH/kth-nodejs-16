# NodeJS 16 ![Continous Integration](https://github.com/KTH/kth-nodejs-16/actions/workflows/main.yml/badge.svg)

## What versions are installed?

*Npm* and *Yarn* versions are always the latest availible at build time.

Each built image has information about its version in a file called `KTH_NODEJS`. To look into this files content run:

```bash
az login
az acr login -n kthregistry
docker run kthregistry.azurecr.io/kth-nodejs-16 cat /KTH_NODEJS
```

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

## Tags

By default there will always be 2 tags to every build.
The first tag contains date of the build, buildversion and 4 first chars from that builds commit sha.
the second is "latest" there will always only one latest version, replacing the previous version.
This will provide a linear insight in the build history.

## What operating system does this image use?

The image also contains build information from when the operating system was built. This information is located in the root in a file called `KTH_OS` run: `docker run kthregistry.azurecr.io/kth-nodejs-16 cat /KTH_NODEJS`. to view your image, and make sure you are logged in to the ACR as mentioned above.

```bash
Alpine version: 3.13.5
Build date: Sun Jun 20 23:18:18 UTC 2021
```

## Automated builds

There is a schedule for nightly build. New builds are scheduled for 5 times a week. Builds are also automated to trigger when the code in main branch is updated.
