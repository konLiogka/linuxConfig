#! /bin/bash


sudo systemctl start systemd-resolved
sudo systemctl enable systemd-resolved

sudo bash -c 'echo "nameserver 8.8.8.8"> /etc/resolv.conf'

sudo bash -c 'echo -e "[main]/dns=none"> /etc/NetworkManager/NetworkManager.conf'

