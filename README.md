dotfiles
========

dotfiles for my allways-used apps ;) vim, bash, urxvt, irssi.. [WIP]

#### NOT COMPLETLY USABLE!! ####

BASH:
      - PS1 format: time user@hostname - pwd

VIM Bundles:

      - Vundle (gmarik/vundle) 
        Type :BundleInstall to clone new Bundles from vimrc or to update the already installed.
      
      - NERDtree (scrooloose/nerdtree) 
        The vimrc have F2 mapped to toggle the panel, 
        my common keys to open a file are:
            t to open the file in a newtab.
            i to open the file in horizontal split.
            s to open in vertical split.
            m to toogle the menu to add, delete or move files and dirs.
      
      - Powerline (Lokaltog/powerline)
            * Needs +python support, ( for debian try installing vim-nox package)
            * clone Lokaltog/powerline-fonts repository to ~/.fonts to have patched fonts, in fonts/ dir 
            I have Source Code Pro for Powerline (the same font must use the terminal)
            
      - Solarized color theme (altercation/vim-colors-solarized) 
            (for best result the terminal have to use the same theme, see Solarized webpage)
            
      - NERDCommenter (scrooloose/nerdcommenter)
      
      - YouCompleteMe (Valloric/YouCompleteMe) 
            Once is installed with Vundle, go to ~/.vim/bundle/YouCompleteMe and run ./install.sh 
            (with --clang-completer for C family code support)
      - Vim-fugitive (tpope/vim-fugitive)
            Very useful git plugin to not leave vim :)
      - IndentLine (Yggdroot/indentLine)
            Just to have an easy way to follow the indents.
      - CtrlP (kien/ctrlp.vim)
            To find files from everywhere!
            mapped to CTRL-P in normal mode.

URXVT (Xdefaults):

      - Some distros read Xresources instead of Xdefaults, just rename the file.
      - Solarized color theme.
      - Source Code Pro for Powerline font.

TODO:
      
      - Make bashrc distro-independed (Debian flavor actualy)
      - Have a real and complete install script.
      - Add user-config feature, like vimrc-local.

#### USE IT AT YOUR OWN RISK ####
