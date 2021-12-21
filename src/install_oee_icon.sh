#!bin/bash

# tạo biến môi trường chứa link
# input line id
read -p "Enter Line ID: " lineID
#OEE_MONITOR_URL
source ~/.bashrc
if [[ -z "${OEE_MONITOR_URL}" ]]; then
#   "Some default value because OEE_MONITOR_URL is undefined"
    echo "export OEE_MONITOR_URL=\"192.168.3.1/dashboard?line=${lineID}\"" > ~/.bashrc
else
#   
    echo OK
fi
echo ${OEE_MONITOR_URL}
# tải file .desktop về
wget <link oee_monitor.desktop>

# tải script về 
wget <link .start_oee_monitor.sh>

# tải file .desktop về
wget <link oee-icon.png>

# move file .desktop vào Desktop
mv -n oee_monitor.desktop ~/Desktop

# move file .desktop vào Desktop
mv -n oee-icon.png ~/

# move file .desktop vào Desktop
mv -n .start_oee_monitor.sh ~/