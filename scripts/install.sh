#!/bin/bash -e
#
#-----------------------------
# Dotfiles bottstrap script
# Carlos 'Speedlight' Egüez
# Since 1999
#-----------------------------
# Install:
# This is just for -s silent mode
# wget -qO- https://raw.githubusercontent.com/speedlight/dotfiles/master/scripts/install.sh | bash -s -- -s

#------------
# Variables
#------------

DOTSDIR=$HOME/dotified
DOTSBAKDIR=$DOTSDIR.bak

# put in this 'DOTS' variables the files and directories to be bootstraped (without the ".")
DOTS="bashrc vimrc Xdefaults"
DOTSCFG="vim/colors config/terminator"
DOTBASHALIAS="bash_aliases.d"

DEPS="git bash"

# Logfile. See http://stackoverflow.com/questions/3173131/redirect-copy-of-stdout-to-log-file-from-within-bash-script-itself
# First the logfile is truncated, then its stdout AND stderr streams are writed in the file. A plus is we could define separate logfiles of stdout and stderr.
LOGFILE=$HOME/.dotified.log
> $LOGFILE 
exec > >(tee -ia $LOGFILE) # STDOUT stream wrote to logfile
#exec 2> >(tee -ia $LOGFILE >&2) #STDERR stream wrote to logfile 

#------------
# Messages
#------------

#warning() { echo '\033[1;32m=> $1\033[0m;' }
#error() { echo '\033[1;31m=> Error: $1\033[0m;' }
#list_item() { echo '\033[1;32m✔\033[0m $1;' }
#error_item() { echo '\033[1;31m✖\033[0m $1;' }

show_usage() {
    echo -e "Ready to be dotified?"
    echo -e "Usage: $0 [arguments] \n"
    echo -e "Arguments:"
    echo "-h: Display this help message"
    echo "-s: Silent mode: install default settings without prompting for input";
    echo -e "-i: Interactive mode: confirm what to install. \n"
    exit 0;
}

while getopts ':hsi?' flag; do
    case "${flag}" in
        "h") show_usage; exit 0;;
        "s") silent=true;;
        "i") interactive=true ;;
        "?") show_usage; exit 0;;
        *) echo -e "Unexpected option -$OPTARG, see -h for help" >&2 ;;
    esac
done

if [ $# -eq 0 ]; then
    echo -e "You need an argument\n"
    show_usage
    exit 1
elif [[ $silent ]] && [[ $interactive ]]; then
    echo -e "\033[91mOptions -s and -i are mutually exclusive. Use one or the other.\033[m"
    exit 1;
fi

checkenv() {
    echo -e "Checking dependencies.."
    for dep in $DEPS; do
        if [ -x "$(command -v $dep)" ]; then
            echo -e "Dependency $dep ok!"
        else
            echo -e "Dependency $dep not ok!"
            exit 1
        fi
    done
    
#    if [ ! -d "$DOTSDIR" ]; then
#        echo -e "Repository doesn't exist, cloning from github..."
#        git clone https://github.com/speedlight/dotfiles.git $DOTSDIR
#        cd $DOTSDIR
#    else
#        echo -e "Repository already exist, updating it..." 
#        cd $DOTSDIR
#        git pull origin master
#    fi
}

bkpdots() {
    echo -e "Coping your actual dots to $DOTSBAKDIR, please wait... \n 
    !! Keep in mind that running this install again will overwrite those !!"
    for dot in $DOTS; do
        if [ -e $HOME/.$dot ]; then
            cp -RfL $HOME/.$dot $DOTSBAKDIR/.
        fi
    done

    for dotcfg in $DOTSCFG; do
        if [ -e $HOME/.$dotcfg ]; then
            cfg1=$(sed "s|\/.*||" <<< $dotcfg)
            #cfg2=$(find $HOME -maxdepth 2 -type l -exec ls -d {} \; |grep $dotcfg |sed "s|^$HOME\/\.||")
            if [ ! -e $DOTSBAKDIR/.$dotcfg ]; then
                mkdir -p $DOTSBAKDIR/.$dotcfg
            fi
            cp -RfL $HOME/.$dotcfg $DOTSBAKDIR/.$cfg1/.
        fi
    done

    if [ -e $HOME/.bash_aliases ]; then
        cp $HOME/.bash_aliases $DOTSDIR/$DOTBASHALIAS/.bash_aliases_$HOSTNAME
    fi

    echo -e "Your originals configs has been backed up to $DOTSBAKDIR"
}

backup() {
    while true; do
        read -e -n 1 -r -p "Do you want to backup your original dotfiles? [y/N] " choice
        case $choice in
            [yY])
                while true; do
                    if [ -d $DOTSBAKDIR ]; then
                        read -e -n 1 -r -p "Backup directory $DOTSBAKDIR already exist, do you want to overwrite? [y/N]" resp
                        case $resp in
                            [yY])
                                bkpdots
                                break;;
                            [nN])
                                echo -e "Instalation aborted, please copy $DOTSBAKDIR to other location"
                                exit 1;
                                break;;
                            *)
                                echo -e "\033[91mPlease choose y or n.\033[m";;
                        esac
                    elif ! [ -d $DOTSBAKDIR ]; then
                        mkdir -p $DOTSBAKDIR
                        bkpdots
                        break
                    fi
                done
                break;;
            [nN])
                echo -e "No configs backed up"
                break;;
            *)
                echo -e "\033[91mPlease choose y or n.\033[m";;
        esac
    done
}

intfonts() {
    while true; do
        read -e -n 1 -r -p "Do you want to add $DOTSDIR/fonts and update the font cache? [y/N] " choice
        case $choice in
            [yY])
                fonts
                break;;
            [nN])
                echo -e "Dotified fonts location not added"
                break;;
            *)
                echo -e "\033[91mPlease choose y or n.\033[m";;
        esac
    done
}

fonts() {
    if [ ! -d $HOME/.fonts ]; then
        mkdir -p $HOME/.fonts
    fi
    for f in $(ls -1 $DOTSDIR/fonts); do
      ln -fs $DOTSDIR/fonts/$f $HOME/.fonts/
      echo -e "Symlink for .$f in $HOME/.fonts/ created.." 
    done
    echo -e "Updating fonts cache to include $DOTSDIR/fonts location.."
    fc-cache -fv >/dev/null
}

silent_install() {
    checkenv
    echo -e "Silent dotified process...\n 
    Let the robot do his job..."
    sleep 1
    symlinkdots
}

interactive_install() {
    checkenv
    echo -e "Interactive dotified process... \n
    Better a human machine..."
    sleep 1
    symlinkdots
}

symlinkdots() {
    cd $HOME
    for dot in $DOTS; do
        if [ -e $DOTSDIR/$dot ]; then
            ln -fs $DOTSDIR/$dot .$dot 
            echo -e "Symlink for .$dot in $HOME/.$dot created.." 
            sleep 1
        fi
    done

    for dotcfg in $DOTSCFG; do
        if [ -e $DOTSDIR/$dotcfg ]; then
            cfg=$(sed "s|\/.*||" <<< $dotcfg)
            ln -fs $DOTSDIR/$dotcfg .$cfg/
            echo -e "Symlink for .$dotcfg in $HOME/.$cfg/.$dotcfg created.." 
            sleep 1
        fi
    done

    if [ -e $DOTSDIR/$DOTBASHALIAS ]; then
        if [ -L .$DOTBASHALIAS ]; then
            unlink .$DOTBASHALIAS
            ln -fs $DOTSDIR/$DOTBASHALIAS .$DOTBASHALIAS
        else 
            ln -fs $DOTSDIR/$DOTBASHALIAS .$DOTBASHALIAS
        fi
        echo -e "Symlink for .$DOTBASHALIAS in $HOME/.$DOTBASHALIAS created.." 
        sleep 1
    fi
}

if [ $silent ]; then
    mkdir -p $DOTSBAKDIR
    bkpdots
    silent_install
    fonts
    echo -e "You are now dotified!! Check the $LOGFILE to review any change"
fi

if [[ $interactive ]] && ! [[ $silent ]]; then
    backup
    interactive_install
    intfonts
    echo -e "You are now dotified!! Check the $LOGFILE to review any change"
fi
