#!/bin/bash
filename="$1"
mkdir -p /root/SDInstallLogs/
LOG_FILE="/root/SDInstallLogs/linuxpubinstaller.log"
touch $LOG_FILE
{
exec 2>&1
#Copying the Publisher build files
echo "Copying the Publisher build files"
cp -r /root/SDInstaller/SD-AppFiles/linux/publish /data/
cp -r /root/SDInstaller/SD-BuildFiles/linux/publisher /etc/init.d/
chmod u+x /etc/init.d/publisher /data/publish/start-pub-ng.sh
#Setting delayed start
echo "sleep 15;" >> /etc/rc.local
echo "service publisher start" >> /etc/rc.local
echo "Creating Publisher data folder"
mkdir -p /data/publish_data
WEBIP=$(grep WEBSERVERIP $filename |sed 's/WEBSERVERIP=//g')
export WEBIP
echo "IP Address of Web Machine is $WEBIP"
DBIP=$(grep DBINDEXERIP $filename |sed 's/DBINDEXERIP=//g')
export DBIP
echo "IP Address of DB Machine is $DBIP"
PUBIP=$(grep PUBLISHERIP $filename |sed 's/PUBLISHERIP=//g')
export PUBIP
echo "IP Address of Publisher is $PUBIP"

echo "Updating Publisher configuration file"
echo "Updating DBIndexer IP bootstrap.properties"
sed -i "s/dbindexerip/$DBIP/g" /data/publish/bootstrap.properties
sleep 5;
#echo "Starting Publisher service"
#sleep 5;
service publisher start
echo -e "\e[92mdone!\e[0m"
} | tee $LOG_FILE
echo ""
echo ""
#echo "Please check the log file $LOG_FILE for checking the SmartDocs Linux Publisher installer status"
