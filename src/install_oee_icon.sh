#!bin/bash

# tạo biến môi trường chứa link
# input line id
read -p "Enter Line ID: " lineID
echo "Line ID = ${lineID}" 
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
wget https://github.com/KhoaAnhVo/linux-post-install/raw/main/src/oee_line_monitor.desktop

# tải script về 
wget https://github.com/KhoaAnhVo/linux-post-install/raw/main/src/.start_oee_monitor.sh

# tải icon về
wget https://github.com/KhoaAnhVo/linux-post-install/raw/main/resource/oee-icon.png

clear
# move file .desktop vào Desktop
mv -n oee_line_monitor.desktop ~/Desktop/

# move file .desktop vào Desktop
mv -n oee-icon.png ~/

# move file .desktop vào Desktop
mv -n .start_oee_monitor.sh ~/

rm oee_line_monitor.desktop
rm oee-icon.png
rm .start_oee_monitor.sh
