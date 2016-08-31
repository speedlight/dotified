"<-----------------<>------------------>"
"      Speedlight vim configuration     "
" https:/github.com/speedlight/dotfiles "
"<-----------------<>------------------>"

" Copied from https://github.com/VundleVim and modified by me :)
" Automatic Vundle instalation taken from:
" http://erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/

let Vundled=1
let vundle_readme=expand($HOME.'/.vim/bundle/vundle/README.md')

if !filereadable(vundle_readme) 
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p $HOME/.vim/bundle
  silent !git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/vundle
  let Vundled=0
endif

set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add your bundles here
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"  Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"  Plugin 'L9'
" Git plugin not hosted on GitHub
"  Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"  Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"  Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"  Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line

Plugin 'Valloric/YouCompleteMe'
Plugin 'jnurmine/Zenburn'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Yggdroot/indentLine'
Plugin 'hdima/python-syntax'
Plugin 'davidhalter/jedi-vim'

call vundle#end()            " required

if Vundled == 0
  echo "Installing Vundles, please ignore key map error mesagges..."
  echo ""
  :PluginInstall
  :qa
endif

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" see :h vundle for more details or wiki for FAQ

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use: filetype plugin on

" Put your non-Plugin stuff after this line

colors Tomorrow-Night-Eighties
set encoding=utf-8
set nu
set laststatus=2
set t_Co=256
set showcmd
set tabstop=4
set shiftwidth=4
set expandtab

let g:Powerline_symbols = 'fancy'
let g:ycm_autoclose_preview_window_after_completion=1
let g:indentLine_color_term = 239
let python_highlight_all=1

" PEP8 Tabulation
" au BufNewFile,BufRead *.py
"     \ set tabstop=4
"     \ set softtabstop=4
"     \ set shiftwidth=4
"     \ set textwidth=79
"     \ set expandtab
"     \ set autoindent
"     \ set fileformat=unix

autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

autocmd FileType html set sw=2
autocmd FileType html set ts=2
autocmd FileType html set sts=2

" Keybinds 
let mapleader=","
" F2 para abrir NERDTree
map <F2> :NERDTreeToggle<CR>
" pega sin formato el texto
nmap <MouseMiddle> <esc>
" buffer next/previous
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <S-F12> :bp<CR>
" tabs
map + :tabnew<CR>
map - :tabclose<CR>
map <S-Tab> :tabn<CR>
map <S-A-Tab> :tabp<CR>
syntax on
