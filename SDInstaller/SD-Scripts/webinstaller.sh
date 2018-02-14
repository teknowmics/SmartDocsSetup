#!/bin/bash
filename="$1"
mkdir -p /root/SDInstallLogs/
LOG_FILE="/root/SDInstallLogs/webinstaller.log"
touch $LOG_FILE
{
exec 2>&1
#stopping services
service memcached stop;service tomcat7 stop;service nginx stop

echo "Copying the API files to tomcat7 webapps folder"
cp -r /root/SDInstaller/SD-AppFiles/API/server /var/lib/tomcat7/webapps/

echo "Copying the Reports and SmartDocs configuration files"
mkdir -p /etc/smartdocs
cp -rv /root/SDInstaller/SD-AppFiles/API/*.sql /root/SDInstaller/SD-AppFiles/API/template /root/SDInstaller/SD-AppFiles/API/Reports /root/SDInstaller/SD-AppFiles/API/Instruction_guides /root/SDInstaller/SD-AppFiles/API/log4j.properties /root/SDInstaller/SD-AppFiles/API/smartDocsMain.xml /etc/smartdocs/
echo "Copying SmartDocs license file"
cp -rv /root/SDInstaller/SD-AppFiles/API/sd_temp.lic /etc/smartdocs/
echo "Copying UI files"
mkdir -p /var/www/smartdocs
cp -r /root/SDInstaller/SD-AppFiles/UI/* /var/www/smartdocs/
chmod -R 775 /var/www/smartdocs/
WEBIP=$(grep WEBSERVERIP $filename |sed 's/WEBSERVERIP=//g')
export WEBIP
echo "IP Address of Web Machine is $WEBIP"
DBIP=$(grep DBINDEXERIP $filename |sed 's/DBINDEXERIP=//g')
export DBIP
echo "IP Address of DB Machine is $DBIP"
PUBIP=$(grep PUBLISHERIP $filename |sed 's/PUBLISHERIP=//g')
export PUBIP
echo "IP Address of Publisher is $PUBIP"
#updating SMartDocs configuration file
echo "Updating smartDocsMain.xml configuration file"
echo "Updating DBIndexer IP smartDocsMain.xml"
sed -i "s/dbindexerip/$DBIP/g" /etc/smartdocs/smartDocsMain.xml
echo "Updating Web IP smartDocsMain.xml"
sed -i "s/webip/$WEBIP/g" /etc/smartdocs/smartDocsMain.xml

#Updating Nginx Infra Admin URL
#sed -i "s/webip/$WEBIP/g" /etc/nginx/conf.d/ssl.conf
#Create SmartDocs log and file upload directories and reset permission to unix user sduser
mkdir -p /var/log/smartDocs
mkdir -p /var/localstorage/destfolder
mkdir -p /var/tmp/fupload
mkdir -p /data/sd_data
chown -R sduser.sduser /var/lib/tomcat7/ /etc/smartdocs/ /var/log/smartDocs/ /var/localstorage/destfolder /var/tmp/fupload
chmod -R 775 /var/lib/tomcat7/ /etc/smartdocs/ /var/log/smartDocs/ /var/localstorage/destfolder /var/tmp/fupload

echo "Starting services"
rm -rf /var/lib/tomcat7/work/* /var/lib/tomcat7/temp/*
service memcached start;service tomcat7 start;service nginx start
#Copying SD Admin scripts
mkdir -p /root/scripts
cp -rv /root/SDInstaller/SD-BuildFiles/sdadmin_scripts/* /root/scripts/
chmod u+x /root/scripts/*.sh
} | tee $LOG_FILE
echo ""
echo ""
echo "SmartDocs is deployed in $(hostname -I). You may please access infra admin url via https://$(hostname -i)/infraAdminUI"
#echo "Please check the log file $LOG_FILE for checking the SmartDocs Web installer status"
