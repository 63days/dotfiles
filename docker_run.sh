#!/bin/bash

docker run \
    -it \
    --ipc=host \
    --cap-add LINUX_IMMUTABLE \
    -p 6363:22 \
    -e DISPLAY=$DISPLAY \
    --restart unless-stopped \
    --pid=host \
    --gpus 'all,"capabilities=compute,utility,graphics,display"'\
    --hostname docker1 \
    --name juil \
    -v="$HOME/.Xauthority:/root/.Xauthority:rw" \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -v /home/juil/docker_home:/home/juil \
    -v "/scratch:/scratch" \
    -v "/home/shared:/home/shared" \
		-v "/home:/home/blackhole:ro" \
    juil:1.0 \
    /bin/zsh
