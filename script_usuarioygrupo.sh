#!/bin/bash

if [ $# -lt 2 ]; then
        echo "Error: ha agregado menos de dos argumentos"
        exit 1
elif [ $# -gt 2 ]; then
        echo "Error: solo puede agregar dos argumentos. El primero para el nombre de usuario y el segundo para el nombre del grupo."
        exit 1
fi


