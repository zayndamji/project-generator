#!/bin/bash

# BASEDIR is where the shell script is located
BASEDIR=$1

# creates library folder
mkdir "/usr/local/share/projectgenerator/"
echo "Created lib folder."
mkdir "/usr/local/share/projectgenerator/templates/"
cp -r "$BASEDIR/templates/" "/usr/local/share/projectgenerator/templates/"
echo "Added templates to lib folder."

# creates man file
if [ ! -d "/usr/local/share/man/man1" ]
then
  mkdir "/usr/local/share/man/man1"
  echo "Created man directory."
fi
cp "$BASEDIR/generate.1" "/usr/local/share/man/man1/"
echo "Added man file."