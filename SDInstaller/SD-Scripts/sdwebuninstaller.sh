#!/bin/bash
echo "Preparing uninstaller steps."
sleep 5;
mkdir -p /root/SDInstallLogs/                                                                                                                                           
LOG_FILE="/root/SDInstallLogs/sdwebuninstaller.log"
touch $LOG_FILE                                                                                                                                                         
{                                                                                                                                                                       
exec 2>&1
read -r -p "Are You Sure that you want to run the web uninstaller?. Please note that uninstaller will DELETE the SmartDocs web files from the system!!!!! [Y/n] " input
case $input in
    [yY][eE][sS]|[yY])
		echo "Yes"
echo "OK Proceeding with removal of SmartDocs Web files"
echo "Stopping SmartDocs Web services"
service memcached stop;service tomcat7 stop;service nginx stop
echo "Removing SmartDocs Web files"
sleep 10;
rm -rf /etc/smartdocs/* /var/lib/tomcat7/webapps/server /var/www/smartdocs/*
echo "Starting SmartDocs Web services"
service memcached start;service tomcat7 start;service nginx start
sleep 5;
echo "Web uninstallation is done!!!"
		;;
 
    [nN][oO]|[nN])
		echo ""
		echo "You chose No. Uninstaller will exit now!"
       		;;
 
    *)
	echo "Sorry,Invalid input provided. Uninstaller will exit now!"
	exit 1
	;;
esac
} | tee $LOG_FILE
echo ""
echo ""
echo "Please check the log file $LOG_FILE for checking the SmartDocs Web uninstaller status"
