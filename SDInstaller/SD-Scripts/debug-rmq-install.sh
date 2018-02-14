#!/bin/bash
HOST_NAME=$(hostname -I)
mkdir -p /root/SDInstallLogs/
LOG_FILE='/root/SDInstallLogs/verify-rmq.log'
touch $LOG_FILE
{
exec 2>&1
        echo ""
        echo "Checking status of RabbitMQ service"
RMQ_PID=$(ps -fe | grep /usr/lib/rabbitmq/lib/rabbitmq_server-3.5.4/ | grep -v grep | tr -s " "|cut -d" " -f2)

if [ "$RMQ_PID" -ne 0 ] &>/dev/null

then

{
        echo ""
        echo "RabbitMQ service is running with $RMQ_PID"
	echo ""
	echo "Listing RMQ installed packages"
rpm -qa |grep rabbitmq-server
	echo ""
	echo "Printing RMQ user list"
rabbitmqctl list_users
	echo ""
	echo "Printing RMQ virtual host list"
	echo ""
rabbitmqctl list_vhosts
	echo "Printing RMQ virtual host permissions"
	echo ""
rabbitmqctl list_permissions -p sdrmq
}

else

{
        echo ""
        echo "RabbitMQ service is not running on $HOST_NAME"
}

fi
} | tee $LOG_FILE
echo ""
echo ""
echo "RabbitMQ install verification check is done. Please open the log file $LOG_FILE to see the status details."
