docker run -it \
    --ipc=host \
    --pid=host \
    --restart unless-stopped \
    --gpus all \
    -p @PORT_NUM:22 \
    --name @CONTAINER_NAME \
    -h geometry \
    -v $HOME/docker_home:$HOME \
    @IMAGE_NAME \
    /bin/zsh
