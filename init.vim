call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install -all'}
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'blueyed/vim-diminactive'
Plug 'machakann/vim-highlightedyank'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'preservim/tagbar'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
call plug#end()

""""""""""""""""""""""""""""""""""
"""""""""""" COC.NVIM """"""""""""
""""""""""""""""""""""""""""""""""
set hidden 
set updatetime=300
set shortmess+=c
let g:python3_host_prog = '/home/ubuntu/venv/bin/python'
let g:coc_global_extensions = ['coc-json', 'coc-pyright']
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! EnterSelect()
    " if the popup is visible and an option is not selected
    if pumvisible() && complete_info()["selected"] == -1
        return "\<C-y>\<CR>"

    " if the pum is visible and an option is selected
    elseif pumvisible()
        return coc#_select_confirm()

    " if the pum is not visible
    else
        return "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
    endif
endfunction

inoremap <silent><expr> <cr> EnterSelect()
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

function! Search(word) abort
return coc#rpc#notify('search', [a:word])
endfunction

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
nnoremap <silent> <space>f  :call Search(input('Enter word to search: '))<CR>

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" general settings
filetype plugin indent on

if has("syntax")
syntax on
endif

set nu 
set incsearch ignorecase smartcase hlsearch
set ruler
set title
set splitright splitbelow
set encoding=UTF-8
set mouse=a
set ts=4 sts=4 shiftwidth=4 expandtab
set autoindent cindent smartindent
set updatetime=100
set clipboard=unnamedplus
set showmode
set wrap breakindent
set formatoptions-=ro "turn off comment when inserting a new line below the comment

au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

" mapping
let mapleader=","
nmap <leader>vimrc :e ~/.config/nvim/init.vim<cr>
"nmap <leader>f :Files<cr>
nmap <F3> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
map <esc> :noh<cr>
map <leader>q :bp<cr>
map <leader>e :bn<cr>
"map <leader>w :bn|bp # <cr>
map <leader>w :bp\|bw #<CR>
"map <leader>w :bw<cr>
map <leader>diag :CocDiagnostics 4<cr>
set pastetoggle=<f2>

" theme
colo onedark

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif
set background=dark
" vim-airline
let g:airline_theme='onedark'
let g:airline#extensions#coc#enabled = 1 
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_section_warning = ''

" fzf
let g:fzf_action = {
	\ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

"NERDTree 

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
" https://github.com/preservim/nerdtree/issues/1272
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

"nvim-preview
let g:mkdp_open_to_the_world = 1 
let g:mkdp_open_ip = '127.0.0.1'
let g:mkdp_port = 5555
