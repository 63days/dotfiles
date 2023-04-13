docker run \
    -it \
    --ipc=host \
    --cap-add LINUX_IMMUTABLE \
    --volume /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -p 6364:22 \
    -e DISPLAY=$DISPLAY \
    --restart unless-stopped \
    --pid=host \
    --gpus \
    'all,"capabilities=compute,utility,graphics,display"'\
    --name juil-temp \
    -v /home/juil/docker_home:/home/juil \
    -v="$HOME/.Xauthority:/root/.Xauthority:rw" \
    -v="/home/shared:/shared" \
    juil_temp \
    /bin/zsh
