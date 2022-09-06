docker run \
    -it \
    --ipc=host \
    --cap-add LINUX_IMMUTABLE \
    --volume /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -e DISPLAY=unix$DISPLAY \
    --restart unless-stopped \
    --gpus all \
    -p 6363:22 \
    --name juil \
    -v /home/juil/docker_home:/home/juil \
    juil \
    /bin/zsh
