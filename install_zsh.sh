#!/bin/bash
# oh-my-zsh

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

if [ $(program_is_installed zsh) == 1 ]; then
    echo_pass zsh
else
    echo_fail zsh
    sudo apt-get install -y zsh
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTON:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

sed -i 's/# alias zshconfig="mate ~\/.zshrc"/alias zshconfig="source ~\/.zshrc"/g' ${HOME}/.zshrc
if ! grep "source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ${HOME}/.zshrc; then
    echo "source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${HOME}/.zshrc
else
    echo "already zsh-autosuggestions linked"
fi
    
if ! grep "source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ${HOME}/.zshrc; then
    echo "source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${HOME}/.zshrc
else
    echo "already zsh-syntax-highlighting linked"
fi

if ! grep "prompt_context()" ${HOME}/.zshrc; then
    echo 'prompt_context() {
        if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
            prompt_segment black default "%(!.%{%F{yellow}%}.) juil"
        fi
    }' >> ${HOME}/.zshrc
fi

if [ $(program_is_installed nvim) == 1 ]; then
    
    if ! grep "alias vi=\"nvim\"" ${HOME}/.zshrc; then
	    echo 'alias vi="nvim"' >> ${HOME}/.zshrc
    fi
    
    if ! grep "alias vim=\"nvim\"" ${HOME}/.zshrc; then
        echo 'alias vim="nvim"' >> ${HOME}/.zshrc
    fi
fi

# change theme
ln -s ${PWD}/juil.zsh-theme ~/.oh-my-zsh/themes/
sed -i 's/robbyrussell/juil/' ~/.zshrc
source ${HOME}/.zshrc


