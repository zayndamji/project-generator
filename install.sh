#!/bin/bash

# LIBDIR is where the library is located, BASEDIR is where the shell script is located
LIBDIR="/usr/local/share"
BASEDIR=$(dirname "$BASH_SOURCE")

# checks if user is root because commands to install need root access
if [ "$EUID" -ne 0 ]
then
  echo "Please run as root."
  exit 1
fi

# checks if project generator is already installed
if [ -d "$LIBDIR/projectgenerator/" ]
then
  echo "Project generator has already been installed on your system."
  exit 1
fi

# creates library folder
mkdir "$LIBDIR/projectgenerator/"
echo "Created lib folder."
mkdir "$LIBDIR/projectgenerator/templates/"
cp -r "$BASEDIR/templates/" "$LIBDIR/projectgenerator/templates/"
echo "Added templates to lib folder."

# creates man file
<<man
if [ ! -d "$LIBDIR/man/man1" ]
then
  mkdir "$LIBDIR/man/man1"
  echo "Created man directory."
fi
cp "$BASEDIR/generate.sh.1" "$LIBDIR/man/man1/"
echo "Added man file."
man