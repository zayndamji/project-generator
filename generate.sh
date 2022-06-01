#!/bin/bash

BASEDIR=$(dirname "$0")

install() {
  sudo mkdir /usr/local/share/projectgenerator/
  echo "Created lib folder."
  sudo cp -r "$BASEDIR/templates/" /usr/local/share/projectgenerator/templates/
  echo "Added templates to lib folder."
}

if [ ! -d "/usr/local/share/projectgenerator/" ]
then
  echo "Sorry, but you have not installed this software. Installing right now..."
  install
  exit 0
fi

if [ "$1" == "update" ]
then
  cd /usr/local/share/
  sudo rm -r projectgenerator/
  echo "Removed lib folder."
  install

elif [ "$1" == "uninstall" ]
then
  cd /usr/local/share/
  sudo rm -r projectgenerator/
  echo "Removed lib folder."
  echo "Project generator has been uninstalled from your system."

elif [ "$1" == "install" ]
then
  echo "Sorry, but you have already installed this software. To update, use the 'update' command."

else
  echo "Sorry, but you have entered an incorrect argument"

fi
