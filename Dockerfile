# syntax=docker/dockerfile:experimental
ARG UNRAR_VERSION

########################
# 1. Build the unrar binary on Alpine
########################
FROM alpine:latest AS builder
ARG UNRAR_VERSION TARGETARCH TARGETVARIANT
RUN CPUARCH=${TARGETARCH}${TARGETVARIANT} \
&& if [ $CPUARCH == "armv6" ]; then export QEMU_CPU="arm1176"; fi \
&& apk add --no-cache build-base wget ca-certificates

WORKDIR /src
RUN wget -O unrar.tar.gz \
    https://www.rarlab.com/rar/unrarsrc-${UNRAR_VERSION}.tar.gz \
    && tar xzf unrar.tar.gz \
    && cd unrar \
    && make -j2 \
    && cp unrar /unrar_${TARGETARCH}${TARGETVARIANT} 

########################
# 2. Export a minimal image containing only the binary
########################
FROM scratch AS export-unrar
ARG TARGETARCH TARGETVARIANT
COPY --from=builder /unrar_${TARGETARCH}${TARGETVARIANT} /
ENTRYPOINT ["/unrar_${TARGETARCH}${TARGETVARIANT}"]