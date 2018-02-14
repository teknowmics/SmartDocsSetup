#!/bin/bash
HOST_NAME=$(hostname -I)
mkdir -p /root/SDInstallLogs/
LOG_FILE='/root/SDInstallLogs/verify-localstorage.log'
touch $LOG_FILE
{
exec 2>&1
        echo ""
        echo "Checking status of local storage"
	echo "Checking NFS service status"
service nfs status
service rpcbind status
	echo ""
	echo "checking startup settngs"
chkconfig --list |grep nfs
chkconfig --list |grep rpcbind
	echo ""
	echo "NFS export details"
showmount -e localhost
	echo ""
	echo "Following storage packages are installed"
	echo "##################################"
rpm -qa |grep cifs-utils
rpm -qa |grep nfs-util
	echo "##################################"
	echo ""

} | tee $LOG_FILE
echo ""
echo ""
echo "Local storage install verification check is done. Please open the log file $LOG_FILE to see the status details."
