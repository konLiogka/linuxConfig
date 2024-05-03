#! /bin/bash


sudo systemctl start systemd-resolved
sudo systemctl enable systemd-resolved

sudo bash -c 'echo "nameserver 8.8.8.8"> /etc/resolv.conf'

<<<<<<< HEAD
sudo bash -c 'echo -e "[main]\ndns=none" > /etc/NetworkManager/NetworkManager.conf'
=======
sudo bash -c 'echo -e "[main]/dns=none"> /etc/NetworkManager/NetworkManager.conf'
>>>>>>> 37adf42d049f1897ed6d695a38e1166ce09efc6a

