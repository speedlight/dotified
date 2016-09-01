dotfiles
========

#### USE IT AT YOUR OWN RISK ####

dotfiles for my allways used apps ;)
The install script can be run in silent or interactive modes. Silent mode dont ask for any confirmation. Interactive mode, ask confirmation in some steps like backup of original dotfiles (the only confirmation by now :D ). Look at install.sh for see what is really happening.

INSTALL:

Can be installed in silent mode via wget with:
wget -qO- https://raw.githubusercontent.com/speedlight/dotfiles/master/scripts/install.sh | bash -s -- -s

Or for interactive mode:
git clone https://github.com/speedlight/dotfiles.git ~/dotified
./dotified/scripts/install.sh -i

BASH:

The bashrc have git prompt from Shawn O. Pearce <spearce@spearce.org> (see git-prompt.sh for details).
Aliases can be created in diferent files under bash_aliases.d directory(for per machine purposes) and bashrc loads them automatically.

VIM:

The vimrc file autoinstall Vundle if isnt already installed, PEP8 identation and the following plugins.

      - Vundle (gmarik/vundle) 
        Type :BundleInstall to clone new Bundles from vimrc or to update the already installed.
      
      - NERDtree (scrooloose/nerdtree) 
        The vimrc have C-n mapped to toggle the panel, 
        my common keys to open a file are:
            t to open the file in a newtab.
            i to open the file in horizontal split.
            s to open in vertical split.
            m to toogle the menu to add, delete or move files and dirs.
      
      - Powerline (Lokaltog/powerline)
            * Needs +python support, ( for debian try installing vim-nox package)
            * clone Lokaltog/powerline-fonts repository to ~/.fonts to have patched fonts. !! The fonts are also in fonts/ directory and the install script load'em at user level.
            
      - YouCompleteMe (Valloric/YouCompleteMe) 
            Once is installed with Vundle, go to ~/.vim/bundle/YouCompleteMe and run ./install.sh 
            (with --clang-completer for C family code support)

      - IndentLine (Yggdroot/indentLine)
            Just to have an easy way to follow the indents.

      - CtrlP (kien/ctrlp.vim)
            To find files from everywhere!
            mapped to ctrl-p in normal mode.

Xdefaults:

      - Some distros read Xresources instead of Xdefaults, just rename the file.
      - Solarized color theme.
      - Source Code Pro for Powerline font.

terminator:
      - Just transparency, no scrollbar and Source Code Pro for Powerline font.

TODO:
      - Add user-config feature, like vimrc-local.
      - Simple way to have per-machine configs like bash aliases, PS1, etc.
      - Better yet, simple way to have profiles.
      - Desktop screenshot and/or per app.
      - Ideas? 

