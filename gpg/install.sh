#!/bin/sh
#
# GPG
#

# Install GPG utils
if test ! $(which pinentry-mac)
then
  echo "Installing gpg and pinentry"
  brew install gpg 
  brew install gpg2
  brew install pinentry-mac

  mkdir -m 0700 ~/.gnupg
  echo "pinentry-program $(brew --prefix)/bin/pinentry-mac" | tee ~/.gnupg/gpg-agent.conf
  pkill -TERM gpg-agent
fi
exit 0
