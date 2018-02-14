#!/bin/bash
echo "Listing dependency packages..."
sleep 10;
cat > /tmp/dep-list.txt << EOL
wget
curl
vim
lsof
expect
libaio
unzip
erlang-R14B
gcc
gcc-c++
make
zlib-devel
pcre-devel
openssl-devel
autoconf
libtool
automake
EOL
mkdir -p /root/SDInstallLogs/
LOG_FILE='/root/SDInstallLogs/verify-dep-packages.log'
touch $LOG_FILE
{
exec 2>&1
echo ""
echo "Following dependency packages are installed"
echo ""
echo "########################################################################"
for i in $(cat /tmp/dep-list.txt)
do
rpm -qa|grep $i
done
echo "########################################################################"
echo ""
} | tee $LOG_FILE
rm -f /tmp/dep-list.txt
echo ""
echo ""
echo "Listing of updated OS packages done. Please open the log file $LOG_FILE to see the status details"
























