#!/bin/bash

# Makes it so all commands are printed good for debuging
# set -x

# gets the directory of the shell script
BASEDIR=$(dirname "$0")

# check if user is root, if not, exits; only for commands which require it
root() {
  if [ "$EUID" -ne 0 ]
  then
    echo "Please run as root."
    exit 1
  fi
}

# installs the files
install() {
  mkdir /usr/local/share/projectgenerator/
  echo "Created lib folder."
  cp -r "$BASEDIR/templates/" /usr/local/share/projectgenerator/templates/
  echo "Added templates to lib folder."
  if [ ! -d "/usr/local/share/man/man1" ]
  then
    mkdir /usr/local/share/man/man1.
    echo Created man directory
  fi
  cp "$BASEDIR/generate.sh.1" /usr/local/share/man/man1/
  echo "Added man file."
}

# uninstalls the files
uninstall() {
  rm -r /usr/local/share/projectgenerator/
  echo "Removed lib folder."
  rm /usr/local/share/man/man1/generate.sh.1
  echo "Removed man file."
}

# check if software is already installed, if not then starts installing
if [ ! -d "/usr/local/share/projectgenerator/" ]
then
  root
  echo "Sorry, but you have not installed this software. Installing right now..."
  install
  exit 0
fi

# updates library files to latest version
if [ "$1" == "update" ]
then
  root
  uninstall
  install

# uninstalls software from system
elif [ "$1" == "uninstall" ]
then
  root
  uninstall
  echo "Project generator has been uninstalled from your system."

# basically useless command, only runs if software is installed
elif [ "$1" == "install" ]
then
  root
  echo "Sorry, but you have already installed this software. To update, use the 'update' command."

else
  echo "Sorry, but you have entered an incorrect argument."

fi
