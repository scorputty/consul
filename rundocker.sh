#!/usr/bin/env bash

# edit for your situation
VOL_DATA="/Volumes/shares/docker/data/consul/data"
VOL_CONFIG="/Volumes/shares/docker/config/consul/config"

test -d ${VOL_DATA} || VOL_DATA="${PWD}${VOL_DATA}" && mkdir -p ${VOL_DATA}
test -d ${VOL_CONFIG} || VOL_CONFIG="${PWD}${VOL_CONFIG}" && mkdir -p ${VOL_CONFIG}

docker run -d -h $(hostname) \
    -p 8300:8300 \
    -p 8301:8301 \
    -p 8301:8301/udp \
    -p 8302:8302 \
    -p 8302:8302/udp \
    -p 8400:8400 \
    -p 8500:8500 \
    -p 8600:8600 \
    -p 8600:8600/udp \
    -v ${VOL_DATA}:/consul/data \
    -v ${VOL_CONFIG}:/consul/config \
    -v /etc/localtime:/etc/timezone \
    -e PUID=1000 \
    -e PGID=1000 \
    --name=consul --restart=always cryptout/consul

  # for troubleshooting run
  # docker exec -it consul /bin/bash
  # to check logs run
  # docker logs -f consul
  # to change config run
  # docker run -ti cryptout/consul vi /etc/consul-daemon/settings.json
