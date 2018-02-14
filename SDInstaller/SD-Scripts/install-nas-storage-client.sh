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
LOG_FILE="/root/SDInstallLogs/install-nas-storage-client.log"
touch $LOG_FILE
{
exec 2>&1

yum --disablerepo="*" --enablerepo="smartdocs" install cifs-utils -y
mkdir -p /data
#Validate IP function
function validateIP()
 {
         local ip=$1
         local stat=1
         if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
                OIFS=$IFS
                IFS='.'
                ip=($ip)
                IFS=$OIFS
                [[ ${ip[0]} -le 255 && ${ip[1]} -le 255 \
                && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
                stat=$?
        fi
        return $stat
}

echo -n "Please enter the password of the NAS user account 'sduser' :"
	read npass
echo -n "Please enter the share folder name :"
	read sname
echo -n "Please enter the IP Address of the NAS :"
	read ip
	validateIP $ip
if [[ $? -ne 0 ]]; then
                echo -e "Invalid IP Address ($ip) provided, script will exit! \n"
                exit 0;
        else
                echo ""
		echo -e "Adding NAS storage mount point entry in /etc/fstab file \n"
echo "//$ip/sdstorage/  /data cifs  username=sduser,password=$npass,rw,nounix,iocharset=utf8,file_mode=0775,dir_mode=0775,uid=557,gid=557 0 0" >> /etc/fstab
fi
#Mounting the NAS volume
mount -a
echo "Mounted information is shown below"
df -h
echo "NAS client installation is finished"
} | tee $LOG_FILE
#echo "Please check the log file $LOG_FILE for checking the nas client installation status"
