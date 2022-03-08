docker run -it \
    --ipc=host \
    --pid=host \
    --restart unless-stopped \
    --gpus all \
    -p 6363:22 \
    --name juil \
    -h geometry \
    -v /home/juil/docker_home:/home/juil \
    juil:0.2 \
    /bin/zsh
