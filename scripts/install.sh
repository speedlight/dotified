#!/bin/bash -e
#
#-----------------------------
# Dotfiles install script
# Carlos 'Speedlight' Egüez
# Since 1999
#-----------------------------

#------------
# Variables
#------------

DOTSDIR=$HOME/dotfiles
DOTSBAKDIR=$HOME/dotfiles_orig
DOTS="bashrc bash_aliases vimrc vim Xdefaults config/terminator"
deps="git bash"

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
not_met=0
for dep in $deps; do
    if [ -x "$(command -v $dep)" ]; then
        echo "Dependencia $dep cumplida!"
    else
        not_met=1
        nodeps="$dep"
        echo "Dependencia $dep no cumplida!"
        exit 1
    fi
done
#	met=$?
#	not_met=$(echo "$not_met + $met" | bc)
#done
#
#if [ $not_met -gt 0 ]; then
#	error ""
#	exit 1
#fi
#			list_item $1
#		else
#			error_item $1
#		fi
#	return $instaled

backup_orig() {
    while true; do
        read -e -n 1 -r -p "Do you want to backup your original dotfiles? [y/N] " choice
        case $choice in
            [yY])
                while true; do
                    if [ -d $DOTSBAKDIR ]; then
                        read -e -n 1 -r -p "Backup directory $DOTSBAKDIR already exist, do you want to overwrite? [y/N]" resp
                        case $resp in
                            [yY])
                                echo -e "Coping your dots to $DOTSBAKDIR, please wait..."
                                for dot in $DOTS; do
                                    cp -Rf $HOME/.$dot $DOTSBAKDIR/.
                                done
                                echo -e "Your originals configs has been backed up to "
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
                        echo -e "Coping your dots to $DOTSBAKDIR, please wait..."
                        for dot in $DOTS; do
                            cp -Rf $HOME/.$dot $DOTSBAKDIR/.
                        done
                        echo -e "Your originals configs has been backed up to $DOTSBAKDIR"
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
    sleep 1
}

interactive_install() {
    echo -e "Interactive dotified process... Better a human machine..."
    sleep 1
}

instalation() {
	mkdir -p $dir
	for file in $configs; do
	ln -sf $dir/$file $HOME/.$configs
	done
}

#-------------
# Instalacion
#-------------

# copiando archivos indicados en $archivos a $bakdir
#echo -e "Backup configs to: $dotfiles_bak.."
# backup

#echo -e "Instaling..."
#instalation

#echo -e "Done!"

if [ $silent ]; then
    silent_install
fi

if [[ $interactive ]] && ! [[ $silent ]]; then
    backup_orig
    interactive_install
fi
