#!/bin/bash
HOST_NAME=$(hostname -I)
mkdir -p /root/SDInstallLogs/
LOGFILE='/root/SDInstallLogs/verify-memcache-tomcat7.log'
#Check if tomcat7 user exist in the system
        echo "" > "$LOGFILE"
        echo "Checking if tomcat7 user exist in the system"

ret=false
getent passwd tomcat7 >/dev/null 2>&1 && ret=true

if $ret; then

{
        echo "" >> "$LOGFILE"
        echo "tomcat7 user exist in the system" >> $LOGFILE
}

else

{
        echo "" >> "$LOGFILE"
        echo "tomcat7 user does not exist in the system" >> $LOGFILE
}

fi

#Check if tomcat7 home directory exist in the system
        echo "" >> "$LOGFILE"
        echo "Checking if tomcat7 home directory exist in the system"

if [ -d /var/lib/tomcat7 ]
then

{
        echo "" >> "$LOGFILE"
        echo "tomcat7 directory /var/lib/tomcat7 exist in the system" >> $LOGFILE
	echo "" >> "$LOGFILE"
	echo "Tomcat Environment and version details" >> $LOGFILE
/var/lib/tomcat7/bin/version.sh >> $LOGFILE
	echo "" >> "$LOGFILE"
}

else

{
        echo "" >> "$LOGFILE"
        echo "tomcat7 directory /var/lib/tomcat7 does not exist in the system" >> $LOGFILE
}

fi

#Check if tomcat7 is configured to listen on Port 8681
        echo "" >> "$LOGFILE"
                echo "Checking if tomcat7 is configured to listen on Port 8681"
grep 8681 /var/lib/tomcat7/conf/server.xml
if [ $? -eq 0 ]

then

{
        echo "" >> "$LOGFILE"
        echo "tomcat7 service is configured to listen on Port 8681" >> $LOGFILE
}

else

{
        echo "" >> "$LOGFILE"
        echo "tomcat7 service is not configured to listen on Port 8681" >> $LOGFILE
}

fi
echo "" >> $LOGFILE
echo "Printing tomcat7 service status" >> $LOGFILE
echo ""
echo ""
CATALINA_BASE=/var/lib/tomcat7
TOM_PID=$(ps -fe | grep $CATALINA_BASE | grep -v grep | tr -s " "|cut -d" " -f2)
if [ "$TOM_PID" -ne 0 ] &>/dev/null

then

{       
        echo "" >> $LOGFILE
        echo "tomcat7 service is running with $TOM_PID" >> $LOGFILE
}

else

{       
        echo "" >> $LOGFILE
        echo "tomcat7 service is not running on $HOST_NAME." >> $LOGFILE
}

fi

echo ""
echo "" >> $LOGFILE
echo "Printing tomcat7 port listening status" >> $LOGFILE
echo ""
lsof -Pni :8681 >> $LOGFILE
echo ""
echo ""

#Checking if memcached is installed 
        echo "" >> "$LOGFILE"
        echo "Checking if memcached is installed"

if [ -f /usr/bin/memcached ]

then

{
        echo "" >> "$LOGFILE"
        echo "Memcache installation found" >> $LOGFILE
        echo "" >> $LOGFILE
        echo "Memcached installed package details" >> $LOGFILE
rpm -qa | grep memcache >> $LOGFILE
	echo "" >> $LOGFILE

}

else

{
        echo "" >> "$LOGFILE"
        echo "Memcache installation not found" >> $LOGFILE
        echo "" >> $LOGFILE
        echo ""
}

fi
	echo "" >> "$LOGFILE"
echo "Printing memcached service status" >> $LOGFILE
	echo ""
	echo ""
MEM_PID=$(ps -fe | grep /var/run/memcached/memcached.pid | grep -v grep | tr -s " "|cut -d" " -f2)
if [ "$MEM_PID" -ne 0 ] &>/dev/null

then

{
        echo "" >> $LOGFILE
        echo "memcached service is running with $MEM_PID" >> $LOGFILE
}

else

{
        echo "" >> $LOGFILE
        echo "memcached service is not running on $HOST_NAME." >> $LOGFILE
}

fi
	echo "" >> "$LOGFILE"
	echo "Printing memcached port listening status" >> $LOGFILE
lsof -Pni :11211 >> $LOGFILE
	echo "" >> $LOGFILE
	echo ""
echo "Memcache and Tomcat7 install verification check is done. Please open the log file /root/SDInstallLogs/verify-memcache-tomcat7.log to see the status details"


