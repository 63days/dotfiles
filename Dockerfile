FROM pytorch/pytorch:1.9.0-cuda11.1-cudnn8-runtime

ENV TZ Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime

RUN apt-get update && apt-get install -y \
	apt-utils \
	build-essential \
	cmake \
	curl \
	git \
	man \
	wget \
    	htop \
    	vim \
    	nano \
	openssh-server \
	sudo \
	tmux \
	cmake \
	software-properties-common \
	locales \
	zsh && \
	apt-get -y autoremove && apt-get -y clean

# Set the locale
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

RUN groupadd -g 1006 juil
RUN useradd -u 1006 -g 1006 juil
WORKDIR /workspace
RUN chown -R juil:juil /workspace
RUN usermod -aG root juil
USER juil
RUN git clone https://github.com/63days/dotfiles
RUN cd dotfiles
RUN bash dotfiles/install_vim.sh
RUN bash dotfiles/install_zsh.sh

EXPOSE 22

