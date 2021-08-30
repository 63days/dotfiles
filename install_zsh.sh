#!/bin/bash
# oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# auto-suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${HOME}/.zshrc

# syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTON:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${HOME}/.zshrc

sed -i 's/robbyrussell/agnoster/' ~/.zshrc

echo 'prompt_context() {
	if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
		prompt_segment black default "%(!.%{%F{yellow}%}.) juil"
	fi
}' >> ${HOME}/.zshrc

if [ $(program_is_installed nvim) == 1]; then
	echo 'alias vi="nvim"' >> ~/.zshrc
	echo 'alias vim="nvim"' >> ~/.zshrc
fi

source ${HOME}/.zshrc


