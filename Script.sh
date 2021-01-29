#!/bin/bash
echo "`whoami`,即将开始打补丁 "
sleep 3
echo "从官网下载sudo-1.9.5p2.tar.gz"
wget -O "sudo-1.9.5p2.tar.gz" https://www.sudo.ws/dist/sudo-1.9.5p2.tar.gz
tar xzvf sudo-1.9.5p2.tar.gz
cd sudo-1.9.5p2
echo "配置安装sudo-1.9.5p2"
./configure
echo ""
make && sudo make install
echo "=========================================================="
if bash -c "sudo -V" | grep -q '1.9.5p2'; then
   echo "SUCCESS! `whoami`，您的机器已成功打补丁)"
else
   echo "FAILURE! 抱歉，安装补丁失败，请尽快检查原因!"
fi

echo "=========================================================="
echo "安装完成，即将删除sudo-1.9.5p2.tar.gz压缩包"
sleep 3
cd ..
rm sudo-1.9.5p2.tar.gz
rm ./sudo-1.9.5p2 -rf
bash
