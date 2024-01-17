#!/bin/sh
#
# pass

if test ! $(which pass)
then
  echo "Installing pass and pass-otp"
  brew install pass
  brew install pass-otp
fi
