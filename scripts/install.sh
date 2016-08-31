#!/bin/bash -e
#
#-----------------------------
# Dotfiles install script
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
DOTSBAKDIR=$HOME/dotfiles.bak
# put in DOTS variable the name of files and directories (without the ".")
DOTS="bashrc bash_aliases vimrc Xdefaults"
DOTSCFG="vim/colors config/terminator"
DEPS="git bash"

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
        *) echo -e "Unexpected option -$OPTARG, see -h for details" >&2 ;;
    esac
done

if [ $# -eq 0 ]; then
    echo -e "You need an argument\n"
    exit 1
elif [[ $silent ]] && [[ $interactive ]]; then
    echo -e "\033[91mOptions -s and -i are mutually exclusive. Use one or the other.\033[m"
    exit 1;
fi

echo -e "Ready to be dotified?"

echo -e "Verficando dependencias.."
for dep in $DEPS; do
    if [ -x "$(command -v $dep)" ]; then
        echo "Dependencia $dep cumplida!"
    else
        echo "Dependencia $dep no cumplida!"
        exit 1
    fi
done

if [ ! -d "$DOTSDIR" ]; then
    echo -e "Cloning repository..."
    git clone https://github.com/speedlight/dotfiles.git $DOTSDIR
    cd $DOTSDIR
else
    echo -e "Directory already exist, updating the repository..." 
    cd $DOTSDIR
    git pull origin master
fi

bkpdots() {
echo -e "Coping your dots to $DOTSBAKDIR, please wait..."
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
                                echo -e "PLease choose y or n.";;
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

silent_install() {
    echo -e "Silent dotified process... Let the robot do his job..."
    mkdir -p $DOTSBAKDIR
    bkpdots
    sleep 1
}

interactive_install() {
    echo -e "Interactive dotified process... Better a human machine..."
    sleep 1
    cd $HOME
    for dot in $DOTS; do
        if [ -e $DOTSDIR/$dot ]; then
            ln -fs $DOTSDIR/$dot .$dot 
        fi
    done
    for dotcfg in $DOTSCFG; do
        if [ -e $DOTSDIR/$dotcfg ]; then
            cfg1=$(sed "s|\/.*||" <<< $dotcfg)
            ln -fs $DOTSDIR/$dotcfg .$cfg1/.
        fi
    done
}

if [ $silent ]; then
    silent_install
fi

if [[ $interactive ]] && ! [[ $silent ]]; then
    backup
    interactive_install
fi
