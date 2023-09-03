#!/bin/bash

get_permissions_verbose() {
	permisos_usuario="${1:1:3}"
	echo "$permisos_usuario"
	permisos_grupo="${1:4:3}"
        echo "$permisos_grupo"
	permisos_otros="${1:7:3}"
        echo "$permisos_otros"
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

permisos=$(stat -c "%A" "$1")

get_permissions_verbose "$permisos"

