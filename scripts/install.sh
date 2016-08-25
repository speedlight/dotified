#!/bin/bash -e
#
#-----------------------------
# Dotfiles install script
# Carlos 'Speedlight' Egüez
# Since 1999
#-----------------------------

# Show how to run the install script
function show_usage() {
    echo -e "Ready to be dotified?"
    echo -e "Usage: $0 [arguments] \n"
    echo -e "Arguments:"
    echo "-h: Display this help message"
    echo "-s: Silent mode: install default settings without prompting for input";
    echo -e "-i: Interactive mode: confirm what to install. \n"
    exit 0;
}

if [ $# -eq 0 ]; then
    echo -e "You need an argument\n"
    show_usage
fi


#------------
# Variables
#------------

dir=$HOME/dotfiles
bakdir=$HOME/dotfiles_bak
configs="bashrc bash_aliases vimrc .vim Xdefaults"
deps="git bash"

#------------
# Messages
#------------

#warning() { echo '\033[1;32m=> $1\033[0m;' }
#error() { echo '\033[1;31m=> Error: $1\033[0m;' }
#list_item() { echo '\033[1;32m✔\033[0m $1;' }
#error_item() { echo '\033[1;31m✖\033[0m $1;' }

#------------
# Functions
#------------

backup() {
	mkdir -p $bakdir
	for file in $config; do
	cp -Rf  $HOME/.$file $bakdir/.
	done
}

dependencies() {
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
}

silent_install() {
    echo -e "Ready to be dotified?"
    echo -e "Silent dotified process... Let the robot do his job..."
    sleep 1
    dependencies
}

interactive_install() {
    echo -e "Ready to be dotified?"
    echo -e "Interactive dotified process... Better a human machine..."
    sleep 1
    dependencies
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

while getopts 'hsi?' flag; do
    case "${flag}" in
        "h") show_usage; exit 0;;
        "s") silent_install ;;
        "i") interactive_install ;;
        "?") show_usage; exit 0;;
        *) echo -e "Unexpected option, see -h for details" ;;
    esac
done
