# Precompiled unrar binaries

A collection of the unrar binary build for platforms on different platforms.    
Mainly used, to get rid of the compilation process in docker build-processes

The latest and unchanged source-code of unrar is used directly from rarlab website.


## Supported platforms
The binaries are compiled for the following platforms
* amd64
* arm64
* armv7 (armhf)
* armv6 (armel)

All binaries get built in docker buildx for the various platforms, you can get a detailed view about the build-process via the [Dockerfile](https://github.com/avpnusr/par2cmdturbo-build/blob/master/Dockerfile) in this repo.

## Usage
You can access the binaries via the [Releases](https://github.com/avpnusr/par2cmdturbo-build/releases/latest) on this repo or via github API ofc. For convenience, they are not zipped, to be usable right away in the further usages.

The naming of the binaries is based on the build-platform, so the right file is accessible i.e. via ARGs $TARGETARCH / $TARGERVARIANT in the github workflows or build-scripts. 