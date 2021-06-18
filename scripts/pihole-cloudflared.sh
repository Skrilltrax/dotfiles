#!/bin/bash

curl -sSL https://install.pi-hole.net | bash

wget https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-arm.tgz
tar -xvzf cloudflared-stable-linux-arm.tgz
sudo cp ./cloudflared /usr/local/bin
sudo chmod +x /usr/local/bin/cloudflared
sudo cloudflared -v

sudo useradd -s /usr/sbin/nologin -r -M cloudflared
sudo curl https://gist.githubusercontent.com/Skrilltrax/3689a0167c4d83ddeb35cf68c0655ade/raw/2931cb3cbb6cd72105fa845de807cb0cc693d37c/cloudflared >> ~/cloudflared-config
sudo cp cloudflared-config /etc/default/cloudflared
sudo chown cloudflared:cloudflared /etc/default/cloudflared
sudo chown cloudflared:cloudflared /usr/local/bin/cloudflared
sudo curl https://gist.githubusercontent.com/Skrilltrax/516558699535775386683c0dd8353369/raw/a7904b0b3b018013342db17986282b3012a4d9d4/cloudflared.service >> ~/cloudflared.service
sudo cp cloudflared.service /lib/systemd/system/cloudflared.service
sudo systemctl enable cloudflared
sudo systemctl start cloudflared
sudo systemctl status cloudflared

rm -r cloudflared
rm cloudflared.service
rm cloudflared-config 
