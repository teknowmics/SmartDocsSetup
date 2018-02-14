#!/bin/bash
HOST_NAME=$(hostname -I)
mkdir -p /root/SDInstallLogs/
LOG_FILE='/root/SDInstallLogs/verify-network.log'
touch $LOG_FILE
{
exec 2>&1
echo "Assigned IP is $HOST_NAME"
echo "Doing PING test to assigned IP Address $HOST_NAME"
count=$( ping -c 3 $HOST_NAME | grep icmp* | wc -l )

if [ $count -eq 0 ]
then
    echo ""
    echo "PING Test failed!!..Network interface is down"

else
    echo ""
    echo "PING Test success!!..Network interface is up"

fi
echo ""
       	echo "Checking if hostname is resolvable"
hostname -f
if [ $? -ne 0 ]

then

{
        echo ""
        echo "Hostname is not resolvable"
	echo ""
	echo "CAUTION !!!! : If machine Hostname is not resolvable, SmartDocs Web application won't run."
	echo "You must set resolvable hostname by running the following command from shell."
	echo "echo "$(hostname -I)    $(hostname)" >> /etc/hosts"

}

else

{
        echo ""
        echo "Hostname is resolvable and it is set to $(hostname)"
}

fi
	echo ""
	echo "List of Network interface attached to the machine"
	echo ""
ls  /sys/class/net/
	echo ""
	echo "Status of network interfaces"
	echo ""
ip -o link show | awk '{print $2,$9}'
} | tee $LOG_FILE
echo ""
echo ""
echo "Network verification check is done. Please open the log file $LOG_FILE to see the status details"
