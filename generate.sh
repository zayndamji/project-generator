#!/bin/bash

if [ "$1" == "install" ]
then
  cd /usr/local/share/
  if [ -d "projectgenerator/" ]
  then
    echo "Sorry, but you have already installed this. Please use the 'update' argument to update to the latest version."
  
  else
    sudo mkdir projectgenerator/
    echo "Created lib folder successfully."

  fi

elif [ "$1" == "update" ]
then
  cd /usr/local/share/
  if [ ! -d "projectgenerator/" ]
  then
    echo "Sorry, but you have not installed this. Please use the 'install' argument to install this software."
  
  else
    sudo rm -r projectgenerator/
    sudo mkdir projectgenerator/
  
  fi
fi