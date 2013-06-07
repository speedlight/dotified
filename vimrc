set nocompatible                " vim, not vi
filetype off
syntax on
set background=dark
colorscheme solarized 
let g:Powerline_symbols = 'fancy'

" ------------------ vundle config
set rtp+=~/dotfiles/vim/bundle/vundle/
call vundle#rc()
"let Vundle manage Vundle -- required!
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Lokaltog/powerline', { 'rtp': 'powerline/bindings/vim' }
Bundle 'spf13/PIV'
Bundle 'kien/tabman.vim'
Bundle 'altercation/vim-colors-solarized'
filetype indent plugin on

set encoding=utf-8
set t_Co=256
set expandtab
set tabstop=2
set cindent
set shiftwidth=4
set number                      " muestra número de lineas
set ruler                       " muestra número de linea en la barra
set more                        " más entrada
set autoread                    " para cambios en el archivo
set hlsearch
set showmode
set showcmd
set laststatus=2
set smarttab                    " tab and backspace smart
set tabstop=6                   " 6 espacios
set shiftwidth=6                " 
set showfulltag                 " muestra completado de tags completo
set wildmenu                    " menu has tab completion
set mouse=a                   " soporte para todos los modos
set mousehide                 " oculta mientras se escribe
"set clipboard=unnamed
"set clipboard=unnamedplus

" --------------- Mapeado
" pega sin formato el texto
nmap <MouseMiddle> <esc>"*p
nmap <C-n> :NERDTreeToggle<CR>
" ------------------------------------
