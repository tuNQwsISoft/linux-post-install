#!/bin/bash
echo "CHANGE PC NAME (HOST NAME) : START"
echo "Type new name:"
read -p "Enter New Host Name: " x
sudo hostnamectl set-hostname $x
hostnamectl

echo "CHANGE PC NAME (HOST NAME) : DONE"
