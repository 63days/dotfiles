set nocompatible 
filetype off    

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'nanotech/jellybeans.vim'
Plugin 'morhetz/gruvbox'
Plugin 'preservim/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'SirVer/ultisnips'
"Plugin 'vim-syntastic/syntastic'
Plugin 'dense-analysis/ale'
call vundle#end()
filetype plugin indent on

set nu
set mouse=a

if has("syntax")
    syntax on
endif

set autoindent
set cindent
set ts=4
set sts=4
set shiftwidth=4
set hlsearch
set ignorecase
set smartcase
set expandtab
au BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \ exe "norm g`\"" |
            \ endif

set t_Co=256
colo gruvbox 
"jellybeans
set bg=dark
let g:gruvbox_contrast_dark = 'hard'
nmap <F3> :NERDTreeToggle<CR>
set completeopt-=preview
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_loc_list_height = 3 
