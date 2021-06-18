#!/bin/sh
arg=$1
if [[ "$arg" == *[pP]i* ]]; then
   sudo sed 's/name_servers.*//d' /etc/resolvconf.conf >> /etc/resolvconf.conf.backup
   sudo rm -f /etc/resolvconf.conf
   sudo mv /etc/resolvconf.conf.backup /etc/resolvconf.conf
   sudo echo "name_servers=\"192.168.0.40 1.1.1.1\"" >> /etc/resolvconf.conf
   sudo resolvconf -u
elif [[ "$arg" == *[cC]loud* ]]; then
   sudo sed 's/name_servers.*//d' /etc/resolvconf.conf >> /etc/resolvconf.conf.backup
   sudo rm -f /etc/resolvconf.conf
   sudo mv /etc/resolvconf.conf.backup /etc/resolvconf.conf
   sudo echo "name_servers=\"1.1.1.1 1.0.0.1\"" >> /etc/resolvconf.conf
   sudo resolvconf -u
fi

