[![Build Status](https://travis-ci.org/scorputty/consul.svg?branch=master)](https://travis-ci.org/scorputty/consul) [![](https://images.microbadger.com/badges/image/cryptout/consul.svg)](https://microbadger.com/images/cryptout/consul "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/cryptout/consul.svg)](https://microbadger.com/images/cryptout/consul "Get your own version badge on microbadger.com")

# Docker consul (Alpine)

This is a Dockerfile to set up "Hashicorp Consul" - (https://www.consul.io/).

### Docker Hub
The built image is also hosted at Docker Hub - (https://hub.docker.com/r/cryptout/consul/).
If you don't want to customize the container you can run it directly by typing the following commands.
```sh
export VOL_DATA="/Volumes/shares/docker/data/consul/data"
export VOL_CONFIG="/Volumes/shares/docker/config/consul/config"

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
```

# Build from Dockerfile
Clone this repository and run the build.sh script.
```sh
git clone https://github.com/scorputty/consul.git
cd consul
./build.sh
```

### Variables
Change to match your situation.
```Dockerfile
ENV appUser="consul"
ENV appGroup="1000"
```

### Volumes
Make sure to map the Volumes to match your situation.
```Dockerfile
VOLUME ["/consul/data"]
VOLUME ["/consul/config"]
```

### To run the container
Edit rundocker.sh (this will be replaced by docker-compose soon...).
```sh
./rundocker.sh
```

### WebGUI
To reach the WebGUI go to - (http://localhost:8300).
Or replace localhost with your target IP. Login with admin/consul.

## Info
* Shell access whilst the container is running: `docker exec -it consul /bin/sh`
* To monitor the logs of the container in realtime: `docker logs -f consul`

# Notes
I'm still learning Docker and use these private (pet)projects to develop my skills.
While I use these containers myself they are by no means perfect and are always prone to error or change.
That said, even if only one person copies a snippet of code or learns something from my projects I feel I've contributed a little bit to the Open-source cause...
