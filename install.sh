#!/bin/bash
#
#------------
# Variables
#------------

dir=$HOME/dotfiles
bakdir=$HOME/dotfiles_bak
configs="bashrc bash_aliases vimrc .vim Xdefaults"
deps="git vim"

#------------
# Funciones
#------------

warning() { echo "\033[1;32m=> $1\033[0m"; }
error() { echo "\033[1;31m=> Error: $1\033[0m"; }

list_item() { echo " \033[1;32m✔\033[0m $1"; }
error_item() { echo " \033[1;31m✖\033[0m $1"; }

backup() {
	mkdir -p $bakdir
	for file in $config; do
	cp -Rf  $HOME/.$file $bakdir/.
	done
}

deps() {
	type -p $1 &> /dev/null
	local instaled=$?
		if [ $instaled -eq 0 ]; then
			list_item $1
		else
			error_item $1
		fi
	return $instaled
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
warning "Backup configs to: $dotfiles_bak.."
backup

#aviso "Verficando dependencias.."
#not_met=0
#for need in "${dependencias[@]}"; do
#	deps $need
#	met=$?
#	not_met=$(echo "$not_met + $met" | bc)
#done
#
#if [ $not_met -gt 0 ]; then
#	error "Dependencia $not_met no cumplida!"
#	exit 1
#fi
warning "Instaling..."
instalation

warning "Done!"
