#!bin/bash
echo "INSTALL GOOGLE-CHROME : START"

if [[ $(getconf LONG_BIT) = "64" ]]
then
    echo "64bit Detected" &&
    echo "Installing Google Chrome" &&
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
    #sudo dpkg -i google-chrome-stable_current_amd64.deb &&
    sudo apt install google-chrome-stable_current_amd64.deb &&
    rm -f google-chrome-stable_current_amd64.deb
else
    echo "32bit Detected" &&
    echo "Installing Google Chrome" &&
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb &&
    #sudo dpkg -i google-chrome-stable_current_i386.deb &&
    sudo apt install google-chrome-stable_current_amd64.deb &&
    rm -f google-chrome-stable_current_i386.deb
fi

echo "INSTALL GOOGLE-CHROME : DONE"
