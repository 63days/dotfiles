docker run \
    -h geometry1 \ # optional
    -it \
    --ipc=host \ 
    --restart unless-stopped \
    --gpus all \
    #--gpus '"device=0,1"' # You can assign specific gpu devices.
    -p @YOUR_PORT:22 \ # port forwarding
    --name @CONTAINER_NAME \
    -v @HOST_DIR:@CONTAINER_DIR \ # e.g. -v /home/juil/docker_home:/home/juil
    test:0.1 \ # docker image
    /bin/zsh
