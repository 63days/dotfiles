docker run \
    -it \
    --ipc=host \
    --cap-add LINUX_IMMUTABLE \
    --volume /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -e DISPLAY=$DISPLAY \
    --restart unless-stopped \
    --pid=host \
    --gpus all \
    -p 6363:22 \
    --name juil \
    -v /home/juil/docker_home:/home/juil \
    --volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
    juil \
    /bin/zsh
