docker run -p 6363:22 -it \
	--restart unless-stopped \
    --ipc=host \ 
	--gpus '"device=6,7"' \
	--name juil \
	-v /home/juil/docker_home:/home/juil/ \
	juil:0.1 \
	/bin/zsh
#--user $(id -u):$(id -g) \

