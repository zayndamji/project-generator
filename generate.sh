#!/bin/bash

NODEJS="console.log(\"Hello World\");"

if [ "$1" == "nodejs" ]
then
  echo "$NODEJS" > "$PWD/app.js"

else
  echo "You have not put in an option!"

fi