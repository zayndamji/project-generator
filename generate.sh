#!/bin/bash

cd /usr/local/share/
if [ ! -d "projectgenerator/" ]
then
  echo "Sorry, but you have not installed this software. Installing right now..."
  sudo mkdir projectgenerator/
  echo "Created lib folder successfully."
  exit 1
fi

if [ "$1" == "update" ]
then
  cd /usr/local/share/
  sudo rm -r projectgenerator/
  sudo mkdir projectgenerator/
  echo "Recreated lib folder successfully."

elif [ "$1" == "install" ]
then
  echo "Sorry, but you have already installed this software. To update, use the 'update' command."

else
  echo "Sorry, but you have entered an incorrect argument"

fi