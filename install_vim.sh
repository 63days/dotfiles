# Install neovim
sudo add-apt-repository -y ppa:neovim-ppa/stable \
    && sudo apt update \
    && sudo apt install -y neovim

# nodejs, Yarn
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn<Paste>

# Install vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

NVIMDIR=~/.config/nvim

if [ ! -d "$NVIMDIR" ]; then
    echo "== ${NVIMDIR} doesn't exist"
    echo "== create ${NVIMDIR}"
    mkdir -p "$NVIMDIR"
fi

cp ./init.vim "${NVIMDIR}"/init.vim


