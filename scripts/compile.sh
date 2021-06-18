#!/bin/bash

fullfile=$1
filename=$(basename "$fullfile")
extension="${filename##*.}"
filename="${filename%.*}"

g++ $fullfile -o $filename
clear
./$filename
echo
echo
echo
read -p "Press [Enter] to continue"

