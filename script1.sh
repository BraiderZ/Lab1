#!/bin/bash

get_permissions_verbose() {
	echo "$1"
}







if [ $# -lt 1 ]; then
	echo "Error: agregue un archivo como argumento."
	exit 1
elif [ $# -gt 1 ]; then
        echo "Error: solo puede agregar un archivo a la vez."
        exit 1
fi

if [ ! -e $1 ]; then
	echo "Error: el archivo $1 no existe."
	exit 1
fi

permisos= stat -c "%A" $1

get_permissions_verbose "$permisos"

