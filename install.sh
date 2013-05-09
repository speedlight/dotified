#!/bin/bash
#
#------------
# Variables
#------------

dir=$HOME/dotfiles
bakdir=$HOME/dotfiles_bak
archivos="bashrc bash_aliases vimrc Xdefaults"
depencias="git vim"

#------------
# Funciones
#------------

# Aviso
aviso() { echo "\033[1;32m=> $1\033[0m"; }

# Error
error() { echo "\033[1;31m=> Error: $1\033[0m"; }

# item de lista
i_lista() { echo " \033[1;32m✔\033[0m $1"; }
n

# item de error de lista
e_lista() { echo " \033[1;31m✖\033[0m $1"; }

# respaldo
backup() {
	mkdir -p $bakdir
	for file in $archivos; do
	cp -Rf  $HOME/.$file $bakdir/
	done
	
}

# Verificación de dependencias
deps() {
	type -p $1 &> /dev/null
	local instalado=$?
		if [ $instalado -eq 0 ]; then
			i_lista $1
		else
			e_lista $1
		fi
	return $instalado
}

# instalación
instalacion() {
	mkdir -p $dir
	for file in $archivos; do
	ln -s $dir/$file $HOME/.$archivos
	done
}


#-------------
# Instalacion
#-------------


# copiando archivos indicados en $archivos a $bakdir
aviso "Respaldando archivos a $dotfiles_bak.."
backup

aviso "Verficando dependencias.."
not_met=0
for need in "${dependencias[@]}"; do
	deps $need
	met=$?
	not_met=$(echo "$not_met + $met" | bc)
done

if [ $not_met -gt 0 ]; then
	error "Dependencia $not_met no cumplida!"
	exit 1
fi

aviso "Instalando.."
instalacion

popd
aviso "Terminado!"
exec $SHELL -1
