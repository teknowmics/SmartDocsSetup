#!/bin/bash
echo "Verify OS installation..."
sleep 10;
mkdir -p /root/SDInstallLogs/
LOG_FILE='/root/SDInstallLogs/verify-os.log'
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
} | tee $LOG_FILE
echo ""
echo ""
echo "OS install verification is done. Please open the log file $LOG_FILE to see the status details"
























