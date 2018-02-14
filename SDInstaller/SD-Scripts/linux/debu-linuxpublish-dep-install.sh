#!/bin/bash
echo "Listing linux publisher dependency packages..."
sleep 10;
cat > /tmp/lindep-list.txt << EOL
ImageMagick
ghostscript
libreoffice-headless
libreoffice-writer
libreoffice-impress
libreoffice-calc
autocorr-ja
ipa-gothic-fonts
ipa-mincho-fonts
ipa-pgothic-fonts
ipa-pmincho-fonts
libreoffice-langpack-ja
vlgothic-fonts
vlgothic-p-fonts
vlgothic-fonts-common
EOL
mkdir -p /root/SDInstallLogs/
LOG_FILE='/root/SDInstallLogs/verify-linuxpublish-dep.log'
touch $LOG_FILE
{
exec 2>&1
echo ""
echo "Following linux publisher dependency packages are installed"
echo ""
echo "########################################################################"
for i in $(cat /tmp/lindep-list.txt)
do
rpm -qa|grep $i
done
echo "########################################################################"
echo ""
echo "XPDFRC settings are listed below"
echo ""
awk 'NF' /usr/local/etc/xpdfrc |grep -v '#'
echo ""

} | tee $LOG_FILE
rm -f /tmp/lindep-list.txt
echo ""
echo ""
echo "Listing of updated OS packages done. Please open the log file $LOG_FILE to see the status details"
























