#!/bin/bash

# Create bin directory

if [ ! -d "$HOME/src" ]
then
    echo "$HOME/src does not exist"
    echo "Creating directory"
    mkdir $HOME/src
fi


# Clone rogauracore

cd $HOME/src/
git clone https://github.com/skrilltrax/rogauracore
cd rogauracore
git checkout initialize_keyboard

# Install dependencies
# sudo apt install autoconf libusb-1.0-0 libusb-1.0-0-dev

# Build rogauracore
autoreconf -i
./configure
make

# Copy to $HOME/bin/

if [ ! -d "$HOME/bin" ]
then
    echo "$HOME/bin does not exist"
    echo "Creating directory"
    mkdir $HOME/bin
fi

if [ -f "$HOME/bin/rogauracore" ]
then
    rm $HOME/bin/rogauracore
fi

cp rogauracore $HOME/bin/rogauracore

if [ -f "$HOME/.bashrc" ]
then
    sudo echo "PATH=$PATH:$HOME/bin/" >> $HOME/.bashrc
fi

if [ -f "$HOME/.zshrc" ]
then
    sudo echo "PATH=$PATH:$HOME/bin/" >> $HOME/.zshrc
fi

sudo sh -c 'echo "roguaracore initialize_keyboard" >> /etc/rc.local'
