set nocompatible                " vim, not vi
filetype off
colorscheme dante
syntax on

" ------------------
"  vundle config
"  ----------------
set rtp+=~/dotfiles/vim/bundle/vundle/
call vundle#rc()

"let Vundle manage Vundle -- required!
Bundle 'gmarik/vundle'
" Bundle 'tpope/vim-fugitive'
filetype indent plugin on

set expandtab
set tabstop=2
set cindent
set shiftwidth=4
set number                      " muestra número de lineas
set ruler                       " muestra número de linea en la barra
set more                        " más entrada
set autoread                    " para cambios en el archivo
set showmode
set showcmd
set smarttab                    " tab and backspace smart
set tabstop=6                   " 6 espacios
set shiftwidth=6                " 
set showfulltag                 " muestra completado de tags completo
set wildmenu                    " menu has tab completion
" ------------------------------------
"  mouse support
set mouse=a                   " soporte para todos los modos
set mousehide                 " oculta mientras se escribe
" pega sin formato el texto
map <MouseMiddle> <esc>"*p    
" ------------------------------------
set hlsearch
