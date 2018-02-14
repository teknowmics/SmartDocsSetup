#!/usr/bin/bash                                                                                                                                                         
mkdir -p /root/SDInstallLogs/                                                                                                                                           
myuser=smartdocs
mypass=smartdocs
LOG_FILE="/root/SDInstallLogs/verify-sddbinstaller.log"
touch $LOG_FILE
{                                                                                                                                                                       
exec 2>&1
echo ""
echo "Listing MySQL databases"
echo ""
mysql -u$myuser -p$mypass -hlocalhost -N -e "SHOW DATABASES;"
echo ""
echo "Getting details of sd common database"
echo "Expected number of tables in sd common database is 43"
echo ""
mytcount=$(mysql -u$myuser -p$mypass -hlocalhost -N -e "SHOW TABLES from sd_common_db;" |wc -l)
echo "Number of tables found in sd common database is $mytcount"
echo ""
echo "Listing MySQL users"
mysql -u$myuser -p$mypass -hlocalhost -N -e "SELECT CONCAT(QUOTE(user),'@',QUOTE(host)) UserAccount FROM mysql.user;"
echo ""
echo ""
mysql -u$myuser -p$mypass -hlocalhost -N -e "SELECT CONCAT(QUOTE(user),'@',QUOTE(host)) UserAccount FROM mysql.user;" > /tmp/myulist.txt
for i in $(cat /tmp/myulist.txt)
do
echo "Displaying permission of MySQL user $i"
mysql -u$myuser -p$mypass -hlocalhost -N -e "show grants for $i"
echo ""
echo ""
done
rm -f /tmp/myulist.txt
} | tee $LOG_FILE
echo ""
echo ""
echo "Please check the log file $LOG_FILE for checking the SmartDocs database installer status"
