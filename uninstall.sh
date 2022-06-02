#!/bin/bash

# LIBDIR is where the library is located
LIBDIR="/usr/local/share"

# checks if user is root because commands to uninstall need root access
if [ "$EUID" -ne 0 ]
then
  echo "Please run as root."
  exit 1
fi

# checks if project generator is not installed
if [ ! -d "$LIBDIR/projectgenerator/" ]
then
  echo "Project generator is not installed on your system."
  exit 1
fi

# removes library folder
rm -r /usr/local/share/projectgenerator/
echo "Removed lib folder."

# removes man file
<<man
rm /usr/local/share/man/man1/generate.sh.1
echo "Removed man file."
man