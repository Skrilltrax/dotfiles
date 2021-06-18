#! /bin/bash

# Make src directory

if [ ! -d "$HOME/src"]
then
    mkdir $HOME/src
fi

# Clone repo
cd $HOME/src
git clone https://github.com/leonmaxx/asus_fanmode
cd asus_fanmode

# Install asus fanmode

make
sudo make install
sudo systemctl enable asus_fanmode
sudo systemctl start asus_fanmode

if [ -d "$HOME/bin"]
then
	cp asus_fanmode $HOME/bin/asus_fanmode
fi

