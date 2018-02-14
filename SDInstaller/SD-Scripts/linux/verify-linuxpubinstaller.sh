#!/usr/bin/bash                                                                                                                                                         
mkdir -p /root/SDInstallLogs/                                                                                                                                           
LOG_FILE="/root/SDInstallLogs/verify-linuxpubinstaller.log"
touch $LOG_FILE
echo "Verifying bootstrap.properties file"
sleep 5;
{                                                                                                                                                                       
exec 2>&1
dbhst=$(grep dbhost /data/publish/bootstrap.properties)
echo ""
echo "Publisher database settings is below"
echo "#######################################"
echo "$dbhst"
echo "#######################################"
echo ""
rmqhst=$(grep rmqHost /data/publish/bootstrap.properties)
echo "Publisher rabbitmq settings is below"
echo "#######################################"
echo "$rmqhst"
echo "#######################################"
echo ""
fpath=$(grep file.path /data/publish/template.xml)
echo "Publisher storage reference settings is below"
echo "#######################################"
echo "$fpath"
echo "#######################################"
echo ""
} | tee $LOG_FILE
echo ""
echo ""
echo "Please check the log file $LOG_FILE for checking the SmartDocs database installer status"


