# Update vim
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install -y vim

# Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cp ./init.vim ~/.vimrc
vim +PluginInstall +qall

### Setting for YoucompleteMe ###

# cmake update
wget https://github.com/Kitware/CMake/releases/download/v3.18.2/cmake-3.18.2.tar.gz 
tar -xvf cmake-3.18.2.tar.gz
rm cmake-3.18.2.tar.gz
cd cmake-3.18.2
./bootstrap
make
sudo make install

# other dependencies
sudo apt install -y g++-8 mono-complete golang nodejs default-jdk npm
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
sudo apt update
sudo apt install -y gcc-9 libstdc++6
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 700 --slave /usr/bin/g++ g++ /usr/bin/g++-7
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 800 --slave /usr/bin/g++ g++ /usr/bin/g++-8

# compile YCM
cd ${HOME}/.vim/bundle/YouCompleteMe
python install.py --all

###################################
