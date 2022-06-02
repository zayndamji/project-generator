#!/bin/bash

# removes library folder
rm -r /usr/local/share/projectgenerator/
echo "Removed lib folder."

# removes man file
<<man
rm /usr/local/share/man/man1/generate.sh.1
echo "Removed man file."
man