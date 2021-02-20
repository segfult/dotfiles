syntax on

let g:skip_defaults_vim = 1

set nu
set expandtab
set autoindent
set tabstop=4
set shiftwidth=4
set incsearch
set relativenumber
set noswapfile
set colorcolumn=80
set noerrorbells
set smartindent
set nobackup
set expandtab
set wrap
set smartcase
set mouse=a
set signcolumn=no

colorscheme wal

call plug#begin('~/.config/nvim/plugged')                                                                                             

Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdtree'
Plug 'dylanaraps/wal.vim'

call plug#end()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

let g:user_emmet_leader_key='<C-I>'

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
