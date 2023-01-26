docker run \
    -it \
    --ipc=host \
    --cap-add LINUX_IMMUTABLE \
    --volume /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -p 6364:22 \
    -e DISPLAY=$DISPLAY \
    --restart unless-stopped \
    --pid=host \
    --gpus all \
    --name juil_kcloud_file_share \
    -v /home/juil/docker_home:/home/juil \
    -v="$HOME/.Xauthority:/root/.Xauthority:rw" \
    -v="/home/shared:/shared" \
    juil:0.2 \
    /bin/zsh
