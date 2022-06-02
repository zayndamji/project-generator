#!/bin/bash

# checks if user is root because commands to install need root access
if [ "$EUID" -ne 0 ]
then
  echo "Please run as root."
  exit 1
fi

# LIBDIR is where the library is located
LIBDIR="/usr/local/share"
# BASEDIR is where the shell script is located
BASEDIR=$(dirname "$BASH_SOURCE")

if [ "$1" == "install" ]
then
  if [ -d "$LIBDIR/projectgenerator/" ]
  then
    echo "The project already exists."
  else
    bash "$BASEDIR/tools/install.sh" "$BASEDIR"
    echo "The project has been installed."
  fi

elif [ "$1" == "uninstall" ]
then
  if [ ! -d "$LIBDIR/projectgenerator/" ]
  then
    echo "The project does not exist."
  else
    bash "$BASEDIR/tools/uninstall.sh"
    echo "The project has been uninstalled."
  fi

else
  echo "You have not entered a valid argument. Please use the argument 'install' or 'uninstall'."

fi