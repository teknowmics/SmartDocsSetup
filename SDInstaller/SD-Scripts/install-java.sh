#!/bin/bash
#Installing Java
INSTDIR='/root/SDInstaller'
if [ ! -d "/root/SDInstaller" ]; then
echo "Installer directory SDInstaller is not found in location /root. Please copy the installer folder to /root and run the script again"
echo "Cannot proceed with installation. Script will exit here!!!"
exit 1
fi
mkdir -p /root/SDInstallLogs/
LOG_FILE="/root/SDInstallLogs/install-java.log"
touch $LOG_FILE
{
exec 2>&1
echo "Installing Java...."
sleep 5;
cd $INSTDIR/SD-BuildFiles
mkdir -p /usr/lib/jvm
echo "Extracting Java source files"
tar -xvzf jre-8u51-linux-x64.tar.gz
mv -v jre1.8.0_51/ /usr/lib/jvm/
update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jre1.8.0_51/bin/java" 1
echo "export JRE_HOME="/usr/lib/jvm/jre1.8.0_51"" >> /etc/profile
echo "export PATH="$PATH:$JAVA_HOME/bin"" >> /etc/profile
cp -rv local_policy.jar /usr/lib/jvm/jre1.8.0_51/lib/security/
cp -rv US_export_policy.jar /usr/lib/jvm/jre1.8.0_51/lib/security/
source /etc/profile
echo "java installation finished"
echo "version details"
java -version
} | tee $LOG_FILE
#echo "Please check the log file $LOG_FILE for checking the Java installation status"


