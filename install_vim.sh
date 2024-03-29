#!/bin/bash
# display a message in red with a cross by it
# example
# echo echo_fail "No"
function echo_fail {
  # echo first argument in red
  printf "\e[31m✘ ${1}"
  # reset colours back to normal
  printf "\033\e[0m"
  echo ""
}

# display a message in green with a tick by it
# example
# echo echo_fail "Yes"
function echo_pass {
  # echo first argument in green
  printf "\e[32m✔ ${1}"
  # reset colours back to normal
  printf "\033\e[0m"
  echo ""
}

function program_is_installed {
  # set to 1 initially
  local return_=1
  # set to 0 if not found
  type $1 >/dev/null 2>&1 || { local return_=0; }
  # return value
  echo "$return_"
}

if [ $(program_is_installed nvim) == 1 ]; then
    echo_pass neovim
else
    echo_fail neovim
    sudo apt-get install software-properties-common
    sudo add-apt-repository -y ppa:neovim-ppa/stable
    sudo apt update && sudo apt -y install neovim
fi

if [ $(program_is_installed node) == 1 ]; then
    echo_pass node
else
    echo_fail node
    curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi

if [ $(program_is_installed yarn) == 1 ]; then
    echo_pass yarn
else
    echo_fail yarn
    curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
    echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt-get update && sudo apt-get install yarn
fi

# Install vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

NVIMDIR=~/.config/nvim

if [ ! -d "$NVIMDIR" ]; then
    echo "== ${NVIMDIR} doesn't exist"
    echo "== create ${NVIMDIR}"
    mkdir -p "$NVIMDIR"
fi

ln -s ${PWD}/init.vim "${NVIMDIR}/init.vim"
ln -s ${PWD}/coc-settings.json "${NVIMDIR}/coc-settings.json"
