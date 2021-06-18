#!/bin/bash

sitename="$1"

echo "Trying to ping $sitename"

ping $sitename | awk '{ sent=NR-1; received+=/^.*(time=.+ ms).*$/; loss=0; } { if (sent>0) 
loss=100-((received/sent)*100) } { printf "sent:%d received:%d loss:%d%%\n", sent, received, loss }'

