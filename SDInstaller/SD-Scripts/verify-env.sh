#!/bin/bash
####Bit operation check used for verifying OS base packages############
#########get predefined binary value of osbase from binarylist file###########
osbase=$(grep osbase /root/SDInstaller/SD-BuildFiles/binarylist.txt |awk '{print $2}')
echo "Verify the environment..."
sleep 10;
mkdir -p /root/SDInstallLogs/
LOG_FILE='/root/SDInstallLogs/verify-os.log'
##########compare installed base packages with reference base package list###########
diff /root/install.log /root/SDInstaller/SD-BuildFiles/os-basepackages.txt &> /dev/null
if [ $? -eq 0 ]

then

{
#####save the binary value of osbase#####
echo $osbase > /tmp/sdinstallerbinary.list
echo -e "OS installation is \e[00;32mOK\e[00m"
}

else
{
echo -e "OS installation \e[00;31mFAILED\e[00m"
}
fi
####Read the updated the binary value#######
bitval=$(cat /tmp/sdinstallerbinary.list)
######get predefined binary value of osupdate from binarylist file#####
osdep=$(grep osupdate /root/SDInstaller/SD-BuildFiles/binarylist.txt |awk '{print $2}')
######save installed dep packages to file########
rpm -qa > /tmp/osupdate.list
#echo "Verifying OS Update packages.."
######compare installed packages with reference base package list###########
diff /tmp/osupdate.list /root/SDInstaller/SD-BuildFiles/os-update-packages.txt &> /dev/null
if [ $? -eq 0 ]

then

{
#######save the sum binary value#######
bitsum="$(($bitval+$osdep))"
echo $bitsum > /tmp/sdinstallerbinary.list
echo -e "OS Update is \e[00;32mOK\e[00m"
}

else
{
echo -e "OS Update \e[00;31mFAILED\e[00m"
}
fi

####Read the updated the binary value#######
bitval=$(cat /tmp/sdinstallerbinary.list)
######get predefined binary value of osdep from binarylist file#####
osdep=$(grep osdep /root/SDInstaller/SD-BuildFiles/binarylist.txt |awk '{print $2}')
######save installed dep packages to file########
rpm -qa > /tmp/osdep.list
#echo "Verifying OS dependency packages.."
######compare installed packages with reference base package list###########
diff /tmp/osdep.list /root/SDInstaller/SD-BuildFiles/os-dep-packages.txt &> /dev/null
if [ $? -eq 0 ]

then

{
#######save the sum binary value#######
bitsum="$(($bitval+$osdep))"
echo $bitsum > /tmp/sdinstallerbinary.list
echo -e "Dependency package installation is \e[00;32mOK\e[00m"
}

else
{
echo -e "Dependency package installation \e[00;31mFAIED\e[00m"
}
fi

####Read the updated the binary value#######
bitval=$(cat /tmp/sdinstallerbinary.list)
######get predefined binary value of chkping from binarylist file#####
chkping=$(grep chkping /root/SDInstaller/SD-BuildFiles/binarylist.txt |awk '{print $2}')
#echo "Doing a quick PING test.."
HOST_NAME=$(hostname -I)
#echo "Assigned IP is $HOST_NAME"
#echo "Doing PING test to assigned IP Address $HOST_NAME"
count=$( ping -c 3 $HOST_NAME | grep icmp* | wc -l )

if [ $count -ne 0 ]
then

{
#######save the sum binary value#######
bitsum="$(($bitval+$chkping))"
echo $bitsum > /tmp/sdinstallerbinary.list
echo -e "PING to $HOST_NAME is \e[00;32mOK\e[00m"
}

else
{
echo -e "PING to $HOST_NAME \e[00;31mFAILED\e[00m"
}
fi

####Read the updated the binary value#######
bitval=$(cat /tmp/sdinstallerbinary.list)
######get predefined binary value of chkhost from binarylist file#####
chkhost=$(grep chkhost /root/SDInstaller/SD-BuildFiles/binarylist.txt |awk '{print $2}')
#echo "Checking if hostname is resolvable"
hostname -f &> /dev/null
if [ $? -eq 0 ]

then

{
#######save the sum binary value#######
bitsum="$(($bitval+$chkhost))"
echo $bitsum > /tmp/sdinstallerbinary.list
echo -e "Hostname is \e[00;32mOK\e[00m"
}
else
{
echo -e "Hostname check \e[00;31mFAILED\e[00m"
}
fi
####Read the updated the binary value#######
bitval=$(cat /tmp/sdinstallerbinary.list)
######get predefined binary value of chkjava from binarylist file#####
chkjava=$(grep chkjava /root/SDInstaller/SD-BuildFiles/binarylist.txt |awk '{print $2}')
if [ -f /usr/lib/jvm/jre1.8.0_51/bin/java ]
then

{
bitsum="$(($bitval+$chkjava))"
echo $bitsum > /tmp/sdinstallerbinary.list
echo -e "Java installation is \e[00;32mOK\e[00m"
}
else
{
echo -e "Java installation \e[00;31mFAILED\e[00m"
}
fi
####Read the updated the binary value#######
bitval=$(cat /tmp/sdinstallerbinary.list)
######get predefined binary value of chkmeminstall from binarylist file#####
chkmeminstall=$(grep chkmeminstall /root/SDInstaller/SD-BuildFiles/binarylist.txt |awk '{print $2}')
rpm -qa |grep memcached-1.4.4-5.el6.x86_64 &>/dev/null
if [ "$?" -eq 0 ]

then

{
bitsum="$(($bitval+$chkmeminstall))"
echo $bitsum > /tmp/sdinstallerbinary.list
echo -e "Memcached installation is \e[00;32mOK\e[00m"
}
else
{
echo -e "Memcached installation \e[00;31mFAILED\e[00m"
}
fi
####Read the updated the binary value#######
bitval=$(cat /tmp/sdinstallerbinary.list)
######get predefined binary value of chkmemserv from binarylist file#####
chkmemserv=$(grep chkmemserv /root/SDInstaller/SD-BuildFiles/binarylist.txt |awk '{print $2}')
MEM_PID=$(ps -fe | grep /var/run/memcached/memcached.pid | grep -v grep | tr -s " "|cut -d" " -f2)
if [ "$MEM_PID" -ne 0 ] &>/dev/null

then

{
bitsum="$(($bitval+$chkmemserv))"
echo $bitsum > /tmp/sdinstallerbinary.list
echo -e "Memcached service is \e[00;32mOK\e[00m"
}
else
{
echo -e "Memcached service \e[00;31mFAILED\e[00m"
}
fi
####Read the updated the binary value#######
bitval=$(cat /tmp/sdinstallerbinary.list)
######get predefined binary value of chkt7usr from binarylist file#####
chkt7usr=$(grep chkt7usr /root/SDInstaller/SD-BuildFiles/binarylist.txt |awk '{print $2}')
ret=false
getent passwd tomcat7 >/dev/null 2>&1 && ret=true

if $ret; then

{
bitsum="$(($bitval+$chkt7usr))"
echo $bitsum > /tmp/sdinstallerbinary.list
echo -e "tomcat user check is \e[00;32mOK\e[00m"
}
else
{
echo -e "tomcat user check \e[00;31mFAILED\e[00m"
}
fi
####Read the updated the binary value#######
bitval=$(cat /tmp/sdinstallerbinary.list)
######get predefined binary value of chkt7dir from binarylist file#####
chkt7dir=$(grep chkt7dir /root/SDInstaller/SD-BuildFiles/binarylist.txt |awk '{print $2}')
if [ -d /var/lib/tomcat7 ]
then

{
bitsum="$(($bitval+$chkt7dir))"
echo $bitsum > /tmp/sdinstallerbinary.list
echo -e "tomcat directory check is \e[00;32mOK\e[00m"
}
else
{
echo -e "tomcat directory check \e[00;31mFAILED\e[00m"
}
fi
####Read the updated the binary value#######
bitval=$(cat /tmp/sdinstallerbinary.list)
######get predefined binary value of chkt7serv from binarylist file#####
chkt7serv=$(grep chkt7serv /root/SDInstaller/SD-BuildFiles/binarylist.txt |awk '{print $2}')
CATALINA_BASE=/var/lib/tomcat7
TOM_PID=$(ps -fe | grep $CATALINA_BASE | grep -v grep | tr -s " "|cut -d" " -f2)
if [ "$TOM_PID" -ne 0 ] &>/dev/null

then

{
bitsum="$(($bitval+$chkt7serv))"
echo $bitsum > /tmp/sdinstallerbinary.list
echo -e "tomcat service is \e[00;32mOK\e[00m"
}
else
{
echo -e "tomcat service \e[00;31mFAILED\e[00m"
}
fi
####Read the updated the binary value#######
bitval=$(cat /tmp/sdinstallerbinary.list)
######get predefined binary value of chkngxbin from binarylist file#####
chkngxbin=$(grep chkngxbin /root/SDInstaller/SD-BuildFiles/binarylist.txt |awk '{print $2}')
if [ -f /usr/sbin/nginx ]

then

{
bitsum="$(($bitval+$chkngxbin))"
echo $bitsum > /tmp/sdinstallerbinary.list
echo -e "nginx installation is \e[00;32mOK\e[00m"
}
else
{
echo -e "nginx installation \e[00;31mFAILED\e[00m"
}
fi
####Read the updated the binary value#######
bitval=$(cat /tmp/sdinstallerbinary.list)
######get predefined binary value of chkngxconf from binarylist file#####
chkngxconf=$(grep chkngxconf /root/SDInstaller/SD-BuildFiles/binarylist.txt |awk '{print $2}')
nginx -t &> /dev/null
if [ $? -eq 0 ]

then

{
bitsum="$(($bitval+$chkngxconf))"
echo $bitsum > /tmp/sdinstallerbinary.list
echo -e "nginx configuration is \e[00;32mOK\e[00m"
}
else
{
echo -e "nginx configuration \e[00;31mFAILED\e[00m"
}
fi
####Read the updated the binary value#######
bitval=$(cat /tmp/sdinstallerbinary.list)
######get predefined binary value of chkngxserv from binarylist file#####
chkngxserv=$(grep chkngxserv /root/SDInstaller/SD-BuildFiles/binarylist.txt |awk '{print $2}')
NGX_PID=$(ps -fe | grep 'master process /usr/sbin/nginx -c /etc/nginx/nginx.conf' | grep -v grep | tr -s " "|cut -d" " -f2)
if [ "$NGX_PID" -ne 0 ] &>/dev/null

then

{
bitsum="$(($bitval+$chkngxserv))"
echo $bitsum > /tmp/sdinstallerbinary.list
echo -e "nginx service is \e[00;32mOK\e[00m"
}
else
{
echo -e "nginx service \e[00;31mFAILED\e[00m"
}
fi
####Read the updated the binary value#######
bitval=$(cat /tmp/sdinstallerbinary.list)
######get predefined binary value of chksqlinstall from binarylist file#####
chksqlinstall=$(grep chksqlinstall /root/SDInstaller/SD-BuildFiles/binarylist.txt |awk '{print $2}')
mysqladmin |grep 5.6.23-72.1 &>/dev/null
if [ $? -eq 0 ]

then

{
#######save the sum binary value#######
bitsum="$(($bitval+$chksqlinstall))"
echo $bitsum > /tmp/sdinstallerbinary.list
echo -e "MySQL installation is \e[00;32mOK\e[00m"
rm -f /tmp/sqllist.txt
}
else
{
echo -e "MySQL installation \e[00;31mFAILED\e[00m"
rm -f /tmp/sqllist.txt
}
fi
####Read the updated the binary value#######
bitval=$(cat /tmp/sdinstallerbinary.list)
######get predefined binary value of chksqllogin from binarylist file#####
chksqllogin=$(grep chksqllogin /root/SDInstaller/SD-BuildFiles/binarylist.txt |awk '{print $2}')
mysql -usmartdocs -psmartdocs -h localhost -e 'show databases;' &>/dev/null
if [ $? -eq 0 ]
       
then
{
#######save the sum binary value#######
bitsum="$(($bitval+$chksqllogin))"
echo $bitsum > /tmp/sdinstallerbinary.list
echo -e "MySQL login check is \e[00;32mOK\e[00m"
}
else
{
echo -e "MySQL login check \e[00;31mFAILED\e[00m"
}
fi
####Read the updated the binary value#######
bitval=$(cat /tmp/sdinstallerbinary.list)
######get predefined binary value of chksqlserv from binarylist file#####
chksqlserv=$(grep chksqlserv /root/SDInstaller/SD-BuildFiles/binarylist.txt |awk '{print $2}')
MYSQL_PID=$(ps -fe | grep /usr/sbin/mysqld | grep -v grep | tr -s " "|cut -d" " -f2)
if [ "$MYSQL_PID" -ne 0 ] &>/dev/null

then

{
#######save the sum binary value#######
bitsum="$(($bitval+$chksqlserv))"
echo $bitsum > /tmp/sdinstallerbinary.list
echo -e "MySQL service is \e[00;32mOK\e[00m"
}
else
{
echo -e "MySQL service \e[00;31mFAILED\e[00m"
}
fi
####Read the updated the binary value#######
bitval=$(cat /tmp/sdinstallerbinary.list)
######get predefined binary value of chkrmqinstall from binarylist file#####
chkrmqinstall=$(grep chkrmqinstall /root/SDInstaller/SD-BuildFiles/binarylist.txt |awk '{print $2}')
rpm -qa |grep rabbitmq-server-3.5.4-1.noarch &>/dev/null
if [ "$?" -eq 0 ]

then
{
#######save the sum binary value#######
bitsum="$(($bitval+$chkrmqinstall))"
echo $bitsum > /tmp/sdinstallerbinary.list
echo -e "RabbitMQ installation is \e[00;32mOK\e[00m"
}
else
{
echo -e "RabbitMQ installation \e[00;31mFAILED\e[00m"
}
fi
####Read the updated the binary value#######
bitval=$(cat /tmp/sdinstallerbinary.list)
######get predefined binary value of chkrmqusr from binarylist file#####
chkrmqusr=$(grep chkrmqusr /root/SDInstaller/SD-BuildFiles/binarylist.txt |awk '{print $2}')
rabbitmqctl list_users |grep smartdocs &>/dev/null
if [ "$?" -eq 0 ]

then
{
#######save the sum binary value#######
bitsum="$(($bitval+$chkrmqusr))"
echo $bitsum > /tmp/sdinstallerbinary.list
echo -e "RabbitMQ user configuration is \e[00;32mOK\e[00m"
}
else
{
echo -e "RabbitMQ user configuration \e[00;31mFAILED\e[00m"
}
fi
####Read the updated the binary value#######
bitval=$(cat /tmp/sdinstallerbinary.list)
######get predefined binary value of chkrmqvhost from binarylist file#####
chkrmqvhost=$(grep chkrmqvhost /root/SDInstaller/SD-BuildFiles/binarylist.txt |awk '{print $2}')
rabbitmqctl list_vhosts |grep sdrmq &>/dev/null
if [ "$?" -eq 0 ]

then
{
#######save the sum binary value#######
bitsum="$(($bitval+$chkrmqvhost))"
echo $bitsum > /tmp/sdinstallerbinary.list
echo -e "RabbitMQ vhost configuration is \e[00;32mOK\e[00m"
}
else
{
echo -e "RabbitMQ vhost configuration \e[00;31mFAILED\e[00m"
}
fi
####Read the updated the binary value#######
bitval=$(cat /tmp/sdinstallerbinary.list)
######get predefined binary value of chkrmqperm from binarylist file#####
chkrmqperm=$(grep chkrmqperm /root/SDInstaller/SD-BuildFiles/binarylist.txt |awk '{print $2}')
rabbitmqctl list_permissions -p sdrmq |grep smartdocs &>/dev/null
if [ "$?" -eq 0 ] 

then

{
#######save the sum binary value#######
bitsum="$(($bitval+$chkrmqperm))"
echo $bitsum > /tmp/sdinstallerbinary.list
echo -e "RabbitMQ permission configuration is \e[00;32mOK\e[00m"
}
else
{
echo -e "RabbitMQ permission configuration \e[00;31mFAILED\e[00m"
}
fi
####Read the updated the binary value#######
bitval=$(cat /tmp/sdinstallerbinary.list)
######get predefined binary value of chkrmqserv from binarylist file#####
chkrmqserv=$(grep chkrmqserv /root/SDInstaller/SD-BuildFiles/binarylist.txt |awk '{print $2}')
RMQ_PID=$(ps -fe | grep /usr/lib/rabbitmq/lib/rabbitmq_server-3.5.4/ | grep -v grep | tr -s " "|cut -d" " -f2)
if [ "$?" -eq 0 ]

then

{
#######save the sum binary value#######
bitsum="$(($bitval+$chkrmqserv))"
echo $bitsum > /tmp/sdinstallerbinary.list
echo -e "RabbitMQ service is \e[00;32mOK\e[00m"
}
else
{
echo -e "RabbitMQ service \e[00;31mFAILED\e[00m"
}
fi

####Read the updated the binary value#######
bitval=$(cat /tmp/sdinstallerbinary.list)
######get predefined binary value of chkzkserv from binarylist file#####
chkzkserv=$(grep chkzkserv /root/SDInstaller/SD-BuildFiles/binarylist.txt |awk '{print $2}')
ZK_PID=$(ps -fe | grep /opt/zookeeper-3.4.6/bin | grep -v grep | tr -s " "|cut -d" " -f2)
if [ "$ZK_PID" -ne 0 ] &>/dev/null

then

{
#######save the sum binary value#######
bitsum="$(($bitval+$chkzkserv))"
echo $bitsum > /tmp/sdinstallerbinary.list
echo -e "Zookeeper service is \e[00;32mOK\e[00m"
}
else
{
echo -e "Zookeeper service \e[00;31mFAILED\e[00m"
}
fi

####Read the updated the binary value#######
bitval=$(cat /tmp/sdinstallerbinary.list)
######get predefined binary value of chkslrserv from binarylist file#####
chkslrserv=$(grep chkzkserv /root/SDInstaller/SD-BuildFiles/binarylist.txt |awk '{print $2}')
SLR_PID=$(ps -fe | grep /opt/solr-5.2.1/server | grep -v grep | tr -s " "|cut -d" " -f2)
if [ "$SLR_PID" -ne 0 ] &>/dev/null

then

{
#######save the sum binary value#######
bitsum="$(($bitval+$chkslrserv))"
echo $bitsum > /tmp/sdinstallerbinary.list
echo -e "Solr service is \e[00;32mOK\e[00m"
}
else
{
echo -e "Solr service \e[00;31mFAILED\e[00m"
}
fi

####Read the updated the binary value#######
bitval=$(cat /tmp/sdinstallerbinary.list)
######get predefined binary value of chkslrstat from binarylist file#####
chkslrstat=$(grep chkzkserv /root/SDInstaller/SD-BuildFiles/binarylist.txt |awk '{print $2}')
/opt/solr-5.2.1/bin/solr healthcheck -c collection_sd_build -z localhost:2181 &>/dev/null
if [ "$?" -eq 0 ]

then

{
#######save the sum binary value#######
bitsum="$(($bitval+$chkslrstat))"
echo $bitsum > /tmp/sdinstallerbinary.list
echo -e "Solr collection status is \e[00;32mOK\e[00m"
}
else
{
echo -e "Solr collection status \e[00;31mFAILED\e[00m"
}
fi

