#!/bin/bash
echo "CHANGE PC NAME (HOST NAME) : START"
#echo "Type new name:"
read -p "Enter New Host Name (Ctrl + C to Cancel): " x
sudo hostnamectl set-hostname $x
echo "Host Infor:"
hostnamectl

echo "CHANGE PC NAME (HOST NAME) : DONE"
