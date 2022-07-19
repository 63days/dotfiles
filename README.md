# Build a docker image
You can build an image from _Dockerfile_ by the following command:
```console
$ docker build -t @IMAGE_NAME \ 
    --build-arg USER_NAME=$USER \
    --build-arg PASSWORD=@YOUR_PASSWORD \
    --build-arg UID=$UID \
    .
```
Pass _@VAR_ by hand.

# Instantiate a docker container

Change variables in the docker_run.sh file like below.

__docker_run.sh:__
```sh
docker run \
    -it \
    --ipc=host \ # to prevent memory errors
    --cap-add LINUX_IMMUTABLE \ # to enable chattr
    --volume /tmp/.X11-unix:/tmp/.X11-unix:ro
    -e DISPLAY=unix$DISPLAY
    --restart unless-stopped \
    --gpus all \
    #--gpus '"device=0,1"' # You can assign specific gpu devices.
    -p @PORT_NUM:22 \ # port forwarding
    --name @CONTAINER_NAME \
    -v @HOST_DIR:@CONTAINER_DIR \ # e.g. -v /home/juil/docker_home:/home/juil
    @IMAGE_NAME \ # docker image
    /bin/zsh
```

```console
$ sh docker_run.sh
```

After entering the container, start ssh:
`$ sudo service ssh start`

Now you can directly access to the container:

`$ ssh USER_NAME@143.248.49.20 -p PORT_NUM`

![docker_access](./doc/images/container_access.png)
