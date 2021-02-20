
source $HOME/.vim/plug-config/coc.nvim

syntax on


let g:skip_defaults_vim = 1

set mouse=a
set term=xterm-256color
set relativenumber
set expandtab
set incsearch
set hlsearch
set ignorecase
set nu
set autoindent
set tabstop=4
set shiftwidth=4
set noswapfile
set noerrorbells
set smartindent
set wrap
set linebreak
set wildmenu

set colorcolumn=80
"highlight Normal ctermbg=Black

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Optionally reset the cursor on start:
" augroup myCmds
" au!
" autocmd VimEnter * silent !echo -ne "\e[2 q"
" augroup END
"
call plug#begin('~/.vim/plugged')

 Plug('vim-airline/vim-airline')
 Plug 'Raimondi/delimitMate'
 Plug('neoclide/coc.nvim')
 Plug 'jackguo380/vim-lsp-cxx-highlight'
 Plug 'preservim/nerdtree'
 Plug 'jremmen/vim-ripgrep'
 Plug 'mattn/emmet-vim'

 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim'

call plug#end()




nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:user_emmet_leader_key='<C-I>'
