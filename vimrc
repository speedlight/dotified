set nocompatible                " vim, not vi
filetype off
syntax on
set background=dark
colorscheme dc2
let g:Powerline_symbols = 'fancy'

" ------------------ vundle config
set rtp+=~/dotfiles/vim/bundle/vundle/
call vundle#rc()
" Let Vundle manage Vundle -- required!
Bundle 'gmarik/vundle'
" File and project explorer & block code commenter. Thankz scrooloose!
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
" Plugin for NERDTree to have ony one panel on all tabs
Bundle 'jistr/vim-nerdtree-tabs'
"best status line, python support and patched font needed, Source Code Pro for Powerline in /fonts dir.
Bundle 'Lokaltog/powerline', { 'rtp': 'powerline/bindings/vim' }
" PHP integration for vim.
Bundle 'spf13/PIV'
" tabs panel.
Bundle 'kien/tabman.vim'
" Git wrapper for Vim
Bundle 'tpope/vim-fugitive'
" Show the indent levels
Bundle 'Yggdroot/indentLine'
" CtrlP plugin
Bundle 'kien/ctrlp.vim' 
" -------------------------------

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
set nofoldenable                " disable folding
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

" ----------------------------- Mapeado
nmap <MouseMiddle> <esc>"*p         " pega sin formato el texto
map <F2> :NERDTreeTabsToggle<CR>        " F2 para abrir NERDTreeTabs 
let g:ctrlp_map = '<c-p>' " C-p  para abrir modo normal de CtrlP 
let mapleader = ","
" ------------------------------------
