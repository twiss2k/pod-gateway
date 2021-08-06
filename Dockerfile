FROM alpine:3.14.1
WORKDIR /

# iproute2 -> bridge
# bind-tools -> dig, bind
# dhclient -> get dynamic IP
# dnsmasq -> DNS & DHCP server
# coreutils -> need REAL chown and chmod for dhclient (it uses reference option not supported in busybox)
# bash -> for scripting logic
RUN apk add --no-cache coreutils dnsmasq iproute2 bind-tools dhclient bash

COPY config /default_config
COPY config /config
COPY bin /bin
CMD [ "/bin/entry.sh" ]

ARG IMAGE_SOURCE
#https://github.com/k8s-at-home/template-container-image
LABEL org.opencontainers.image.source $IMAGE_SOURCE
