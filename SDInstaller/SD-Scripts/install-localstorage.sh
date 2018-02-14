#!/bin/bash
osver1=centos-release-6-9.el6.12.3.x86_64
osver2=$(rpm --query centos-release)
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
#Install local NFS 
INSTDIR='/root/SDInstaller'
if [ ! -d "/root/SDInstaller" ]; then
echo "Installer directory SDInstaller is not found in location /root. Please copy the installer folder to /root and run the script again"
echo "Cannot proceed with installation. Script will exit here!!!"
exit 1
fi
mkdir -p /root/SDInstallLogs/
LOG_FILE="/root/SDInstallLogs/install-localstorage.log"
touch $LOG_FILE
{
exec 2>&1
yum --disablerepo="*" --enablerepo="smartdocs" install cifs-utils nfs-util nfs-utils -y
mkdir -p /data/sd_data
chown -R sduser:sduser /data/sd_data
chmod -R 775 /data/sd_data
echo "/data/sd_data	*(rw,sync,anonuid=557,anongid=557,no_subtree_check)" > /etc/exports
exportfs -a
service rpcbind start
chkconfig rpcbind on
service nfs start
chkconfig nfs on
echo "NFS server installation finished"
} | tee $LOG_FILE
#echo "Please check the log file $LOG_FILE for checking the NFS storage installation status"
