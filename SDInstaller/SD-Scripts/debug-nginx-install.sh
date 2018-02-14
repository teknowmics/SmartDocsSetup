#!/bin/bash
#Check nginx installation
mkdir -p /root/SDInstallLogs/
LOG_FILE='/root/SDInstallLogs/verify-nginx.log'
touch $LOG_FILE
{
exec 2>&1
        echo "Checking nginx installation"

if [ -f /usr/sbin/nginx ]

then

{       
        echo ""
        echo "Nginx installation found"
	echo ""
	echo "Installed Nginx version"
nginx -v
	echo ""
}

else

{
        echo ""
        echo "Nginx installation not found"
}

fi

	echo "Checking nginx conf files"
        echo ""
        echo "Check if Nginx config files exists in the system"

if [ -f /etc/nginx/conf.d/default.conf ] && [ -f /etc/nginx/conf.d/ssl.conf ]

then

{
        echo ""
        echo "Both default.conf and ssl.conf files were found in /etc/nginx/conf.d/"
}

else

{
        echo ""
        echo "Either default.conf or ssl.conf file is missing in /etc/nginx/conf.d/"
}

fi

echo ""
echo ""
echo "Printing nginx service status"
ps aux | grep nginx
echo ""
echo ""
echo "Printing nginx port listening status"
echo ""
echo ""
lsof -Pni :80
echo ""
echo ""
lsof -Pni :443
} | tee $LOG_FILE
echo ""
echo ""
echo "Nginx install verification check is done. Please open the log file $LOG_FILE to see the status details."
