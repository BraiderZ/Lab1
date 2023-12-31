#!/bin/bash

if [ $# -lt 2 ]; then
        echo "Error: ha agregado menos de dos argumentos"
        exit 1
elif [ $# -gt 2 ]; then
        echo "Error: solo puede agregar dos argumentos. El primero para el nombre de usuario y el segundo para el nombre del grupo."
        exit 1
fi

if id "$1" &>/dev/null; then
  echo "El usuario $1 ya existe."
else
  sudo useradd $1
fi

if getent group "$2" &>/dev/null; then
  echo "El grupo $2 ya existe."
else
  sudo groupadd $2
fi

sudo chown :$2 script_permisos.sh

usuario_default=$(whoami)

sudo usermod -aG $2 $usuario_default
sudo usermod -aG $2 $1

sudo chmod g+x script_permisos.sh

exit 0
