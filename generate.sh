#!/bin/bash

if [ "$1" == "install" ]
then
  cd /usr/local/share/
  if [ -d "projectgenerator/" ]
  then
    echo "Deleted lib folder."
    sudo rm -r projectgenerator/
  fi
  echo "Created lib folder."
  sudo mkdir projectgenerator/
fi