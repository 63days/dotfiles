docker run \
    -it \
    --ipc=host \
    --cap-add LINUX_IMMUTABLE \
    --volume /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -p 6363:22 \
    -e DISPLAY=$DISPLAY \
    --restart unless-stopped \
    --pid=host \
    --gpus all \
    --hostname docker1 \
    --name juil \
    -v /home/juil/docker_home:/home/juil \
    -v="$HOME/.Xauthority:/root/.Xauthority:rw" \
    -v="/home/shared:/shared" \
    -v"/home/dreamy1534:/home/dreamy1534:ro" \
    -v"/home/hieuristics:/home/hieuristics:ro" \
    -v "/scratch:/scratch" \
    juil:0.3 \
    /bin/zsh
