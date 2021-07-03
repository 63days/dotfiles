call plug#begin()
Plug 'junegunn/fzf/'
Plug 'blueyed/vim-diminactive'
Plug 'sbdchd/neoformat'
Plug 'machakann/vim-highlightedyank'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ycm-core/YouCompleteMe'
Plug 'Yggdroot/indentLine'
call plug#end()

" general settings
filetype plugin indent on

if has("syntax")
	syntax on
endif

set nu rnu
set incsearch ignorecase smartcase hlsearch
set ruler
set title
set splitright splitbelow
set encoding=utf8
set mouse=a
set ts=4 sts=4 shiftwidth=4 expandtab
set autoindent cindent smartindent
set updatetime=100
set clipboard=unnamed
set showmode
set wrap breakindent

au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "norm g`\"" |
    \ endif
set t_Co=256

" mapping
let mapleader=","
nmap <leader>vimrc :tabe ~/.config/nvim/init.vim<cr>
nmap <leader>r :source $MYVIMRC<cr>
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>f :Files<cr>
nmap <F3> :NERDTreeToggle<CR>
map <esc> :noh<cr>
noremap <leader>q <C-w>w
set pastetoggle=<f2>

" theme
colo onedark
set bg=dark
set termguicolors
"hi Pmenu guibg=white guifg=black gui=bold
"hi Normal guibg=NONE ctermbg=NONE
"hi NonText guibg=NONE
"hi Comment gui=BOLD

" vim-airline
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_section_warning = ''

" Neofmrat
let g:neoformat_enabled_python = ["black"]

" fzf
let g:fzf_action = {
	\ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }
