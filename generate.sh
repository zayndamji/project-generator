#!/bin/bash

# Makes it so all commands are printed good for debuging
# set -x

# gets the current directory
BASEDIR=$(pwd "$0")

# check if root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi

# installs the files
install() {
  mkdir /usr/local/share/projectgenerator/
  echo "Created lib folder."
  cp -r "$BASEDIR/templates/" /usr/local/share/projectgenerator/templates/
  echo "Added templates to lib folder."
}

# check id already installed, if not then installs
if [ ! -d "/usr/local/share/projectgenerator/" ]
then
  echo "Sorry, but you have not installed this software. Installing right now..."
  install
  exit 0
fi

# reinstalls
if [ "$1" == "update" ]
then
  cd /usr/local/share/
  rm -r projectgenerator/
  echo "Removed lib folder."
  install

# removes all files
elif [ "$1" == "uninstall" ]
then
  cd /usr/local/share/
  rm -r projectgenerator/
  echo "Removed lib folder."
  echo "Project generator has been uninstalled from your system."

# installs
elif [ "$1" == "install" ]
then
  echo "Sorry, but you have already installed this software. To update, use the 'update' command."

else
  echo "Sorry, but you have entered an incorrect argument"

fi
