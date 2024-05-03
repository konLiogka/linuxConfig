#! /bin/bash


sudo systemctl start systemd-resolved
sudo systemctl enable systemd-resolved


sudo bash -c 'echo -e "[main]\ndns=none" > /etc/NetworkManager/NetworkManager.conf'



