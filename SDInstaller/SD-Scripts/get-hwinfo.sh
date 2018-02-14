#!/bin/bash
#Script used to get Hardware and System information.
cat > /etc/yum.repos.d/smartdocs.repo << EOL
[smartdocs]
name=SmartDocs Repository
baseurl=file:///root/SDInstaller/SD-Packages/
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6
enabled=1
gpgcheck=0
EOL
yum --disablerepo="*" --enablerepo="smartdocs" install dmidecode facter -y
echo ""
echo ""
echo "Collecting system information"
sleep 10;
mkdir -p /root/SDInstallLogs/
LOG_FILE='/root/SDInstallLogs/verify-os-hw.log'
touch $LOG_FILE
{
exec 2>&1
echo ""
echo "###################"
echo ""
echo "Number of Packages installed is $(rpm -qa|wc -l)"
echo ""
echo "###################"
echo ""
echo "###################"
echo ""
echo "Following OS packages are installed"
echo ""
echo "########################################################################"
rpm -qa
echo "########################################################################"
echo ""
OSVER=$(cat /etc/redhat-release)
echo "###################"
echo "Installed OS version is $OSVER $(uname -m) Bit"
echo "###################"
echo ""
echo ""
echo "###################"
echo ""
echo "Number of Packages updated is $(cat /var/log/yum.log |grep Updated |awk '{print $5}'|wc -l)"
echo ""
echo "###################"
echo ""
echo "Following OS packages are updated"
echo ""
echo "########################################################################"
cat /var/log/yum.log |grep Updated |awk '{print $5}'
echo "########################################################################"
echo ""
echo ""
echo "########################################################################"
echo ""
echo ""
echo "Printing Disk Partion details"
echo ""
echo ""
fdisk -l
echo ""
echo ""
echo "########################################################################"
echo ""
echo ""
echo ""
echo ""
echo "########################################################################"
echo ""
echo ""
echo "Printing Logical partition details"
echo ""
echo ""
pvdisplay
echo ""
vgdisplay
echo ""
lvdisplay
echo "########################################################################"
echo ""
echo ""
echo ""
echo ""
echo "########################################################################"
echo ""
echo ""
echo "Printing Mounted Disk on the system"
echo ""
echo ""
mount
echo "########################################################################"
echo ""
echo ""
echo "########################################################################"
df -h
echo "########################################################################"
echo ""
echo ""
echo ""
echo ""
echo "########################################################################"
echo ""
echo ""
echo "Printing Available Network interface on the system"
echo ""
echo ""
ifconfig -a
echo ""
echo ""
echo "Printing Active Network interface on the system"
echo ""
echo ""
ifconfig
echo ""
echo ""
echo "Printing system hostname"
echo ""
echo ""
hostname
echo ""
echo ""
echo "########################################################################"
echo ""
echo ""
echo "########################################################################"
echo ""
echo ""
echo "Printing Hardware information"
echo ""
echo ""
facter
echo ""
echo ""
echo "########################################################################"
echo ""
echo ""
echo "########################################################################"
echo ""
echo ""
echo "Printing System information"
echo ""
echo ""
dmidecode -t system
echo ""
echo ""
echo "Printing Processor information"
echo ""
echo ""
dmidecode -t processor
echo ""
echo ""
echo "Printing Memory information"
echo ""
echo ""
dmidecode -t memory
echo ""
echo ""
echo "Printing Used Memroy details"
echo ""
echo ""
free -m
echo "########################################################################"
} | tee $LOG_FILE
echo ""
echo ""
echo "OS install verification and collecting system information check is done. Please open the log file $LOG_FILE to see the status details"
























