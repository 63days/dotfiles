docker run -p 6363:22 -it \
	--restart unless-stopped \
	--gpus '"device=0,1"' \
	--name juil \
	-v /home/juil/docker_home:/home/juil/ \
	juil:0.1 \
	/bin/zsh
#--user $(id -u):$(id -g) \

