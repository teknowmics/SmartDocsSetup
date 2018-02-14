#!/usr/bin/bash
filename="$1"
mkdir -p /root/SDInstallLogs/
LOG_FILE="/root/SDInstallLogs/dbinstaller.log"
touch $LOG_FILE
{
exec 2>&1
WEBIP=$(grep WEBSERVERIP $filename |sed 's/WEBSERVERIP=//g')
if [ "$WEBIP" == x.x.x.x ]
then
echo "SmartDocs application installer config file $1 is not updated with exact IP Address. Please update the config file with correct IP Address assigned to the system."
echo "SmartDocs database installer will exit here!!!!!"
exit 1
fi
export WEBIP
echo "IP Address of Web Machine is $WEBIP"
DBIP=$(grep DBINDEXERIP $filename |sed 's/DBINDEXERIP=//g')
if [ "$DBIP" == x.x.x.x ]
then
echo "SmartDocs application installer config file $1 is not updated with exact IP Address. Please update the config file with correct IP Address assigned to the system."
echo "SmartDocs database installer will exit here!!!!!"
exit 1
fi
export DBIP
echo "IP Address of DB Machine is $DBIP"
PUBIP=$(grep PUBLISHERIP $filename |sed 's/PUBLISHERIP=//g')
if [ "$PUBIP" == x.x.x.x ]
then
echo "SmartDocs application installer config file $1 is not updated with exact IP Address. Please update the config file with correct IP Address assigned to the system."
echo "SmartDocs database installer will exit here!!!!!"
exit 1
fi
export PUBIP
echo "IP Address of Publisher is $PUBIP"
mysqlpass=$(cat /root/.mysql_secret)
mysql -uroot -p"$mysqlpass" -hlocalhost -N -e "use mysql;"
mysql -uroot -p"$mysqlpass" -hlocalhost -N -e "CREATE USER 'smartdocs'@'$PUBIP' IDENTIFIED BY 'smartdocs';"
mysql -uroot -p"$mysqlpass" -hlocalhost -N -e "GRANT CREATE, CREATE ROUTINE, ALTER, CREATE TABLESPACE, CREATE TEMPORARY TABLES,
CREATE USER, CREATE VIEW, DELETE, EVENT, EXECUTE, FILE, INDEX, INSERT, REFERENCES, RELOAD,
SELECT, SHOW DATABASES, SHOW VIEW, UPDATE ON *.* TO 'smartdocs'@'$PUBIP';"
mysql -uroot -p"$mysqlpass" -hlocalhost -N -e "flush privileges;"
mysql -uroot -p"$mysqlpass" -hlocalhost -N -e "use mysql;"
mysql -uroot -p"$mysqlpass" -hlocalhost -N -e "CREATE USER 'smartdocs'@'$WEBIP' IDENTIFIED BY 'smartdocs';"
mysql -uroot -p"$mysqlpass" -hlocalhost -N -e "GRANT CREATE, CREATE ROUTINE, ALTER, CREATE TABLESPACE, CREATE TEMPORARY TABLES,
CREATE USER, CREATE VIEW, DELETE, EVENT, EXECUTE, FILE, INDEX, INSERT, REFERENCES, RELOAD,
SELECT, SHOW DATABASES, SHOW VIEW, UPDATE ON *.* TO 'smartdocs'@'$WEBIP';"
mysql -uroot -p"$mysqlpass" -hlocalhost -N -e "flush privileges;"
mysql -uroot -p"$mysqlpass" -hlocalhost -N -e "use mysql;"
mysql -uroot -p"$mysqlpass" -hlocalhost -N -e "delete from mysql.user where Password='';"
mysql -uroot -p"$mysqlpass" -hlocalhost -N -e "flush privileges;"
echo "Restoring SD Common database"
mysql -uroot -p"$mysqlpass" -hlocalhost < /root/SDInstaller/SD-AppFiles/API/common.sql
mysql -uroot -p"$mysqlpass" -hlocalhost < /root/SDInstaller/SD-AppFiles/API/common_procedures.sql
echo "SD Common database is restored!!"
} | tee $LOG_FILE
echo ""
echo ""
#echo "Please check the log file $LOG_FILE for checking the SmartDocs database installer status"
