#!/bin/bash

# LIBDIR is where the library is located
LIBDIR="/usr/local/share"
# BASEDIR is where the shell script is located
BASEDIR=$1

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