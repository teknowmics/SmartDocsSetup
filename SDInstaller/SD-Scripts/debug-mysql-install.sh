#!/bin/bash
mkdir -p /root/SDInstallLogs/
LOG_FILE='/root/SDInstallLogs/verify-mysql.log'
HOST_NAME=$(hostname -I)
touch $LOG_FILE
{
exec 2>&1
echo "Checking MySQL service"
MYSQL_PID=$(ps -fe | grep /usr/sbin/mysqld | grep -v grep | tr -s " "|cut -d" " -f2)
if [ "$MYSQL_PID" -ne 0 ] &>/dev/null

then

{
        echo ""
        echo "MySQL service is running with PID $MYSQL_PID"

        echo ""
        echo "Checking MySQ Logins"
mysql -usmartdocs -psmartdocs -h localhost -e 'show databases;' &>/dev/null
        if [ $? -eq 0 ]

        then

{
        echo ""
        echo "MySQL login check passed using smartdocs user"
}


        else

{
        echo ""
        echo "MySQL login check failed using smartdocs user on $HOST_NAME."
}

        fi

}

else

{
        echo ""
        echo "MySQL service is not running on $HOST_NAME"
}

fi
	echo ""
	echo "MySQL installed package details"
	echo ""
rpm -qa | grep Percona*
} | tee $LOG_FILE
echo ""
echo ""
echo "MySQL install verification check is done. Please open the log file $LOG_FILE to see the status details"
