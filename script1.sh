#!/bin/bash

get_permissions_verbose() {
	permisos_usuario="${1:1:3}"
	permisos_grupo="${1:4:3}"
	permisos_otros="${1:7:3}"

	if [[ $permisos_usuario == *"r"* && $permisos_usuario == *"w"* && $permisos_usuario == *"x"* ]]; then
		echo "El usuario posee permisos para: leer, escribir y ejecutar"
	elif [[ $permisos_usuario == *"r"* && $permisos_usuario == *"w"* ]]; then
		echo "EL usuario posee permisos para: leer y  escribir"
	elif [[ $permisos_usuario == *"r"* && $permisos_usuario == *"x"* ]]; then
                echo "EL usuario posee permisos para: leer y  ejecutar"
	elif [[ $permisos_usuario == *"r"* ]]; then
                echo "EL usuario posee permiso para: leer"
	elif [[ $permisos_usuario == *"w"* && $permisos_usuario == *"x"* ]]; then
                echo "EL usuario posee permisos para: escribir y ejecutar"
        elif [[ $permisos_usuario == *"w"* ]]; then
                echo "EL usuario posee permiso para: escribir"
        elif [[ $permisos_usuario == *"x"* ]]; then
                echo "EL usuario posee permiso para: ejecutar"
	else
		echo "El usuario no posee permisos"
	fi


        if [[ $permisos_grupo == *"r"* && $permisos_grupo == *"w"* && $permisos_grupo == *"x"* ]]; then
                echo "El grupo posee permisos para: leer, escribir y ejecutar"
        elif [[ $permisos_grupo == *"r"* && $permisos_grupo == *"w"* ]]; then
                echo "EL grupo posee permisos para: leer y  escribir"
        elif [[ $permisos_grupo == *"r"* && $permisos_grupo == *"x"* ]]; then
                echo "EL grupo posee permisos para: leer y  ejecutar"
        elif [[ $permisos_grupo == *"r"* ]]; then
                echo "EL grupo posee permiso para: leer"
        elif [[ $permisos_grupo == *"w"* && $permisos_grupo == *"x"* ]]; then
                echo "EL grupo posee permisos para: escribir y ejecutar"
        elif [[ $permisos_grupo == *"w"* ]]; then
                echo "EL grupo posee permiso para: escribir"
        elif [[ $permisos_grupo == *"x"* ]]; then
                echo "EL grupo posee permiso para: ejecutar"
        else
                echo "El grupo no posee permisos"
        fi


        if [[ $permisos_otros == *"r"* && $permisos_otros == *"w"* && $permisos_otros == *"x"* ]]; then
                echo "Otros usuarios poseen permisos para: leer, escribir y ejecutar"
        elif [[ $permisos_otros == *"r"* && $permisos_otros == *"w"* ]]; then
                echo "Otros usuarios poseen permisos para: leer y  escribir"
        elif [[ $permisos_otros == *"r"* && $permisos_otros == *"x"* ]]; then
                echo "Otros usuarios poseen permisos para: leer y  ejecutar"
        elif [[ $permisos_otros == *"r"* ]]; then
                echo "Otros usuarios poseen permiso para: leer"
        elif [[ $permisos_otros == *"w"* && $permisos_otros == *"x"* ]]; then
                echo "Otros usuarios poseen permisos para: escribir y ejecutar"
        elif [[ $permisos_otros == *"w"* ]]; then
                echo "Otros usuarios poseen permiso para: escribir"
        elif [[ $permisos_otros == *"x"* ]]; then
                echo "Otros usuarios poseen permiso para: ejecutar"
        else
                echo "Otros usuarios no poseen permisos"
        fi
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

