#!/usr/bin/env bash

./node_modules/.bin/jade $(pwd)/*.jade
./node_modules/.bin/stylus -c --use $(pwd)/node_modules/nib $(pwd)/static/css/style.styl

JSFILES=$(pwd)/cdn/*.js
for f in $JSFILES
do
  ./node_modules/.bin/uglifyjs $f -c -o ${f%.*}.min.js
done