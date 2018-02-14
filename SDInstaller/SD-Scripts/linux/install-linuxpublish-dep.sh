#!/bin/bash
osver1=centos-release-6-9.el6.12.3.x86_64
osver2=$(rpm --query centos-release)
INSTDIR='/root/SDInstaller'
echo "Checking if installed OS version is $osver1"
sleep 5;
if [[ $osver1 == *"$osver2"* ]];then
        {
echo "OS version is $osver2"
        }
else
        {
echo "Installed OS version is not $osver1. Please install correct OS version."
echo "Setup Script will exit here!!!"
exit 1;
        }
fi
echo "Checking if hotname is resolvable"
hostname -f
if [ $? -ne 0 ]
then
{
        echo ""
        echo "Hostname is not resolvable"
        echo ""
        echo "CAUTION !!!! : If machine Hostname is not resolvable, SmartDocs Web application won't run."
        echo "You must set resolvable hostname by running the following command from shell."
        echo "echo "$(hostname -I)    $(hostname)" >> /etc/hosts"
        echo "Script will exit here since hostname is not resolvable. Please re-run after setting resolvable hostname"
        exit 1;
}
fi
if [ ! -d "/root/SDInstaller" ]; then
echo "Installer directory SDInstaller is not found in location /root. Please copy the installer folder to /root and run the script again"
echo "Cannot proceed with installation. Script will exit here!!!"
exit 1
fi
cat > /etc/yum.repos.d/smartdocspub.repo << EOL
[smartdocs-publish]
name=SmartDocs Repository
baseurl=file:///root/SDInstaller/SD-Packages/linux
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6
enabled=1
gpgcheck=0
EOL
mkdir -p /root/SDInstallLogs/
LOG_FILE="/root/SDInstallLogs/install-linuxpublish-dep.log"
touch $LOG_FILE
{
exec 2>&1
echo "Installing General Dependency packages for Linux Publisher"
yum --disablerepo="*" --enablerepo="smartdocs-publish" install -y ImageMagick ghostscript libreoffice-headless libreoffice-writer libreoffice-impress libreoffice-calc
echo "Installing Japanese font packages"
yum --disablerepo="*" --enablerepo="smartdocs-publish" install -y autocorr-ja ipa-gothic-fonts ipa-mincho-fonts ipa-pgothic-fonts ipa-pmincho-fonts libreoffice-langpack-ja vlgothic-fonts vlgothic-p-fonts vlgothic-fonts-common 
echo "Installing Xpdf"
cd $INSTDIR/SD-BuildFiles/linux
tar -xzf xpdfbin-linux-3.04.tar.gz
cp -rv xpdfbin-linux-3.04/bin64/* /usr/local/bin
mkdir -p /usr/local/man/man1
mkdir -p /usr/local/man/man5
cp -rv xpdfbin-linux-3.04/doc/*.1 /usr/local/man/man1
cp -rv xpdfbin-linux-3.04/doc/*.5 /usr/local/man/man5
#Copy the sample-xpdfrc file to /usr/local/etc/xpdfrc
cp -rv xpdfbin-linux-3.04/doc/sample-xpdfrc /usr/local/etc/xpdfrc
#Update Display fonts list in /usr/local/etc/xpdfrc file
cat > /tmp/jpfonts << EOL
#----- begin Japanese support package (2004-jul-27)

cidToUnicode    Adobe-Japan1    /data/publish/xpdf-japanese/Adobe-Japan1.cidToUnicode
unicodeMap      ISO-2022-JP     /data/publish/xpdf-japanese/ISO-2022-JP.unicodeMap
unicodeMap      EUC-JP          /data/publish/xpdf-japanese/EUC-JP.unicodeMap
unicodeMap      Shift-JIS       /data/publish/xpdf-japanese/Shift-JIS.unicodeMap

cMapDir         Adobe-Japan1    /data/publish/xpdf-japanese/CMap

toUnicodeDir    xpdf-japanese/CMap
EOL
cat /tmp/jpfonts >> /usr/local/etc/xpdfrc
#remove /tmp/jpfonts file
rm -f /tmp/jpfonts
#Install Windows fonts in Linux
cp -rv ms-mincho /usr/share/fonts/
cp -rv ms-pmincho /usr/share/fonts/
echo "Installing Dependency packages for Linux Publisher is done."
} | tee $LOG_FILE
#echo "Please check the log file $LOG_FILE for checking the installation status"



