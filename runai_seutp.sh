#!/bin/bash

sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 100
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.8 100

sudo apt-get update && sudo apt-get install -y \
	apt-utils \
	build-essential \
	curl \
	git \
	man \
	wget \
	htop \
	vim \
	universal-ctags \
	tmux \
	software-properties-common \
	ripgrep \
	zsh

sudo apt-get install --reinstall python3-apt -y

bash ./install_vim.sh
bash ./install_zsh.sh
sudo cp /sensei-fs/users/jkoo/lib/dotfiles/nvim-linux64/bin/nvim /bin/nvim
cp /sensei-fs/users/jkoo/lib/dotfiles/tmux.conf ~/.tmux.conf

if ! grep "exec zsh" /etc/profile; then
	echo "exec zsh" | sudo tee -a /etc/profile > /dev/null
else
	echo "already exec zsh in ${HOME}/.bashrc"
fi

if ! [ -e ~/jkoo ]; then
	ln -s /sensei-fs/users/jkoo ~/jkoo
else
	echo "/sense-fs/users/jkoo is already linked to ~/jkoo"
fi

git config --global credential.helper store
