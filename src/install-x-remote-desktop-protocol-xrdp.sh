#!/bin/bash
echo "install xrdp"
sudo apt install xrdp
echo "-- addser xrdp ssl-cert --"
sudo adduser xrdp ssl-cert
echo "-- check wirewall status --"
sudo ufw status
echo "-- enable wirewall --"
sudo ufw enable
echo "-- allow wirewall port 3389/tcp --"
sudo ufw allow 3389/tcp
echo "-- reload wirewall port 3389/tcp --"
sudo ufw reload
echo "-- restart xrdp --"
sudo systemctl restart xrdp
echo "done"
