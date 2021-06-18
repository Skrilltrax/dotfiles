#!/bin/bash

for file in $PWD/*
do
  filename=$(basename "$file")
  extension="${filename##*.}"
  filename="${filename%.*}"
  
if [ "$extension" == "c" ]; then
  echo "Compiling $filename"
  gcc "$filename.$extension" -o "$filename"
fi
done   