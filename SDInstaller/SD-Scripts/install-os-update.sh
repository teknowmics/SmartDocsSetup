#!/bin/bash
osver1=centos-release-6-9.el6.12.3.x86_64
osver2=$(rpm --query centos-release)
echo "Checking if installed OS version is $osver2"
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
echo "Checking if hostname is resolvable"
hostname -f
if [ $? -ne 0 ]
then

{
        echo ""
        echo -e "\e[31mHostname is not resolvable.\e[0m"
        echo ""
        echo -e "\e[93m\e[5mCAUTION !!!! : If machine Hostname is not resolvable, SmartDocs Web application won't run.\e[25m\e[0m"
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
cat > /etc/yum.repos.d/smartdocs.repo << EOL
[smartdocs]
name=SmartDocs Repository
baseurl=file:///root/SDInstaller/SD-Packages/
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6
enabled=1
gpgcheck=0
EOL
mkdir -p /root/SDInstallLogs/
LOG_FILE="/root/SDInstallLogs/install-os-update.log"
touch $LOG_FILE
{
exec 2>&1
setenforce 0
iptables -F
service iptables save
yum --disablerepo="*" --enablerepo="smartdocs" update -y
} | tee $LOG_FILE
#echo "Please check the log file $LOG_FILE for checking the installation status"
