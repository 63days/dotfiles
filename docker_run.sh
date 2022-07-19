docker run \
    -it \
    --ipc=host \ # to prevent memory errors
    --cap-add LINUX_IMMUTABLE \ # to enable chattr
    --volume /tmp/.X11-unix:/tmp/.X11-unix:ro \ # for X11
    -e DISPLAY=unix$DISPLAY \ # for X11
    --restart unless-stopped \
    --gpus all \
    #--gpus '"device=0,1"' # You can assign specific gpu devices.
    -p @PORT_NUM:22 \ # port forwarding
    --name @CONTAINER_NAME \
    -v @HOST_DIR:@CONTAINER_DIR \ # e.g. -v /home/juil/docker_home:/home/juil
    @IMAGE_NAME \ # docker image
    /bin/zsh
