#!/bin/bash
mkdir -p /root/SDInstallLogs/
LOG_FILE='/root/SDInstallLogs/verify-java.log'
touch $LOG_FILE
{
exec 2>&1
	echo "Checking Java Installation"
        echo ""
        echo "Checking JRE 1.8.0.51 binary path"

if [ -f /usr/lib/jvm/jre1.8.0_51/bin/java ]
then

{
        echo ""
        echo "JRE HOME is /usr/lib/jvm/jre1.8.0_51/"
        echo ""
        echo "JRE 1.8.0.51 installation found"
java -version
}

else

{
        echo ""
        echo "JRE 1.8.0.51 installation not found"
}

fi
} | tee $LOG_FILE
source /etc/profile
echo ""
echo ""
echo "Java install verification check is done. Please open the log file $LOG_FILE to see the status details."
