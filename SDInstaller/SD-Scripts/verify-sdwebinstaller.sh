#!/usr/bin/bash                                                                                                                                                         
mkdir -p /root/SDInstallLogs/                                                                                                                                           
LOG_FILE="/root/SDInstallLogs/verify-sdwebinstaller.log"
touch $LOG_FILE
echo "Verifying smartDocsMain.xml file"
sleep 5;
{                                                                                                                                                                       
exec 2>&1
jdbcconf=$(grep smartdocs.datasource.jdbc_url /etc/smartdocs/smartDocsMain.xml)
echo "SmartDocs datasource settings is below"
echo "#######################################"
echo "$jdbcconf"
echo "#######################################"
echo ""
rmqconf=$(grep rabitmq.address /etc/smartdocs/smartDocsMain.xml)
echo "SmartDocs rabbitmq settings is below"
echo "#######################################"
echo "$rmqconf"
echo "#######################################"
echo ""
memconf=$(grep mem.cach.conn.details /etc/smartdocs/smartDocsMain.xml)
echo "SmartDocs memcache settings is below"
echo "#######################################"
echo "$memconf"
echo "#######################################"
echo ""
echo "Listing UI folders"
echo ""
ls /var/www/smartdocs/
echo ""
echo "Listing webapps folder"
echo ""
ls /var/lib/tomcat7/webapps/
echo ""
echo "Listing smartdocs config folder"
echo ""
ls /etc/smartdocs/
} | tee $LOG_FILE
echo ""
echo ""
echo "Please check the log file $LOG_FILE for checking the SmartDocs database installer status"


