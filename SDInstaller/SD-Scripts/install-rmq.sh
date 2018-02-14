#!/bin/bash
osver1=centos-release-6-9.el6.12.3.x86_64
osver2=$(rpm --query centos-release)
echo "Checking if installed OS version is $osver1"
sleep 5;
if [[ $osver1 == *"$osver2"* ]];then
        {
echo "OS version is $osver2"
        }
else
        {
echo "Installed OS version is not $osver1. Please install correct OS version."
echo "Setup Script will exit here!!!"
exit 1;
        }
fi
#Install RabbitMQ
INSTDIR='/root/SDInstaller'
if [ ! -d "/root/SDInstaller" ]; then
echo "Installer directory SDInstaller is not found in location /root. Please copy the installer folder to /root and run the script again"
echo "Cannot proceed with installation. Script will exit here!!!"
exit 1
fi
mkdir -p /root/SDInstallLogs/
LOG_FILE="/root/SDInstallLogs/install-rmq.log"
touch $LOG_FILE
{
exec 2>&1
yum --disablerepo="*" --enablerepo="smartdocs" install rabbitmq-server.noarch -y
chkconfig rabbitmq-server on
service rabbitmq-server start
sleep 5;
rabbitmq-plugins enable rabbitmq_management
rabbitmqctl add_vhost sdrmq
rabbitmqctl add_user smartdocs smartdocs
rabbitmqctl set_user_tags smartdocs administrator
rabbitmqctl set_permissions -p sdrmq smartdocs ".*" ".*" ".*"
echo "RabbitMQ installation finished"
} | tee $LOG_FILE
echo ""
echo ""
#echo "Please check the log file $LOG_FILE for checking the RabbitMQ installation status"
