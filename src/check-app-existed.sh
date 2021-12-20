#!/bin/bash

    echo "enter your package name"
    read name

    dpkg -s $name &> /dev/null

if [ $? -eq 0 ]; then
    echo "Package $name is installed!"
else
    echo "Package $name is NOT installed!"
fi
