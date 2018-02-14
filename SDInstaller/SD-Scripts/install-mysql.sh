#!/bin/bash
osver1=centos-release-6-9.el6.12.3.x86_64
osver2=$(rpm --query centos-release)
echo "Checking if installated OS version is $osver2"
sleep 5;
if [[ $osver1 == *"$osver2"* ]];then
        {
echo "OS version is $osver2"
        }
else
        {
echo "Installed OS version is not $osver2"
echo "Setup Script will exit here!!!"
exit 1;
        }
fi
#Install MySQL
INSTDIR='/root/SDInstaller'
if [ ! -d "/root/SDInstaller" ]; then
echo "Installer directory SDInstaller is not found in location /root. Please copy the installer folder to /root and run the script again"
echo "Cannot proceed with installation. Script will exit here!!!"
exit 1
fi
mkdir -p /data/db_data
mkdir -p /root/SDInstallLogs/
LOG_FILE="/root/SDInstallLogs/install-mysql.log"
touch $LOG_FILE
{
exec 2>&1
yum --disablerepo="*" --enablerepo="smartdocs" install Percona-Server-server-56 -y
sleep 5;

#Moving the default installation folder to /data
echo "Moving the default installation folder to /data"
cp -rv /var/lib/mysql/* /data/db_data
#Add mysql user to sduser group and reset the MySQL data directory permission to sduser. This is needed when you use NAS as storage for SmartDocs data directory.
usermod -g sduser mysql
chown -R sduser.sduser /data/db_data /var/lib/mysql/
chmod -R 775 /data/db_data /var/lib/mysql/
########
echo "Preparing MySQL customization based on installed RAM"
sleep 5;
#Copy the customize MySQL config file based on installed RAM
iram=$(free -g |grep Mem:|awk '{print $2}')
echo "Installed RAM is $iram GB"
echo ""

if [[ $iram -lt 2 ]]; then
echo "copying 2GB shared MySQL config file"
cp -rv /root/SDInstaller/SD-BuildFiles/dbconf/2GB_Share.cnf /etc/my.cnf
service mysql start
fi
if [[ $iram -gt 4 && $iram -lt 8 ]]; then 
echo "copying 8GB shared MySQL config file"
cp -rv /root/SDInstaller/SD-BuildFiles/dbconf/8GB_Share.cnf /etc/my.cnf
service mysql start
fi
if [[ $iram -gt 2 && $iram -lt 4 ]]; then
echo "copying 4GB shared MySQL config file"
cp -rv /root/SDInstaller/SD-BuildFiles/dbconf/4GB_Share.cnf /etc/my.cnf
service mysql start
fi
if [[ $iram -gt 8 && $iram -lt 16 ]]; then
echo "copying 16GB shared MySQL config file"
cp -rv /root/SDInstaller/SD-BuildFiles/dbconf/16GB_Share.cnf /etc/my.cnf
service mysql start
fi
if [[ $iram -gt 16 && $iram -lt 32 ]]; then
echo "copying 32GB shared MySQL config file"
cp -rv /root/SDInstaller/SD-BuildFiles/dbconf/32GB_Share.cnf /etc/my.cnf
service mysql start
fi
if [[ $iram -gt 32 ]]; then
echo "Installed RAM is greater than 32GB. No custom MySQL conf file is available. Please contact SmartDocs team.!!"
cat > /etc/my.cnf << EOL
[mysqld]
datadir = /data/db_data
socket = /tmp/mysql.sock
user = mysql
# Disabling symbolic-links is recommended to prevent assorted security risks
symbolic-links = 0

[mysqld_safe]
log-error = /var/log/mysqld.log
pid-file = /var/run/mysqld/mysqld.pid
EOL
service mysql start
fi
sleep 10;
#Generate Random password and set it for MySQL root user
mkpasswd | tee /root/.mysql_secret &> /dev/null
mysqlpass=$(cat /root/.mysql_secret)
echo $mysqlpass
getip=$(hostname -I)
/usr/bin/mysqladmin -u root password "$mysqlpass"
mysql -uroot -p"$mysqlpass" -hlocalhost -N -e "use mysql;"
mysql -uroot -p"$mysqlpass" -hlocalhost -N -e "CREATE USER 'smartdocs'@'localhost' IDENTIFIED BY 'smartdocs';"
mysql -uroot -p"$mysqlpass" -hlocalhost -N -e "GRANT CREATE, CREATE ROUTINE, ALTER, CREATE TABLESPACE, CREATE TEMPORARY TABLES,
CREATE USER, CREATE VIEW, DELETE, EVENT, EXECUTE, FILE, INDEX, INSERT, REFERENCES, RELOAD,
SELECT, SHOW DATABASES, SHOW VIEW, UPDATE ON *.* TO 'smartdocs'@' localhost ';"
mysql -uroot -p"$mysqlpass" -hlocalhost -N -e "flush privileges;"
mysql -uroot -p"$mysqlpass" -hlocalhost -N -e "drop database test;"
mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -uroot -p"$mysqlpass" mysql
echo "MySQL installation finished"
} | tee $LOG_FILE
echo ""
echo ""
#echo "Please check the log file $LOG_FILE for checking the MySQL installation status"
