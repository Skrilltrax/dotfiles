#!/bin/sh
#
# oh-my-zsh

if [ -z "${ZSH}" ]
then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
