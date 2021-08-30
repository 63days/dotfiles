docker run -p 6363:22 -it \
	--restart unless-stopped \
	--gpus '"device=0,1"' \
	--user $(id -u):$(id -g) \
	--name juil \
	-v /home/juil:/home/juil \
	pytorch/pytorch:1.9.0-cuda11.1-cudnn8-runtime \
	/bin/bash
