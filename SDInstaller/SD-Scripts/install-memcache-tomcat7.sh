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
echo "Installed OS version is not $osver1"
echo "Setup Script will exit here!!!"
exit 1;
        }
fi
INSTDIR='/root/SDInstaller'
if [ ! -d "/root/SDInstaller" ]; then
echo "Installer directory SDInstaller is not found in location /root. Please copy the installer folder to /root and run the script again"
echo "Cannot proceed with installation. Script will exit here!!!"
exit 1
fi
mkdir -p /root/SDInstallLogs/
LOG_FILE="/root/SDInstallLogs/install-memcache-tomcat7.log"
touch $LOG_FILE
{
exec 2>&1
cd $INSTDIR/SD-BuildFiles
#Install tomcat7
tar -xzf apache-tomcat-7.0.54.tar.gz
mv -v apache-tomcat-7.0.54 /var/lib/tomcat7
#Create user tomcat7 and add it to sduser. This is needed when you use NAS as storage for SmartDocs data directory.
groupadd -g 555 tomcat7
useradd -u 555 -s /bin/bash -g tomcat7 tomcat7
usermod -g sduser tomcat7
cat > /var/lib/tomcat7/bin/setenv.sh << EOL
export CATALINA_OPTS="$CATALINA_OPTS -Xms1536m"
export CATALINA_OPTS="$CATALINA_OPTS -Xmx2048m"
EOL
#Copy the init script and set tomcat7 to start on boot
cp -rv tomcat7 /etc/init.d/tomcat7
chmod 755 /etc/init.d/tomcat7 /var/lib/tomcat7/bin/setenv.sh
chkconfig --add tomcat7
chkconfig --level 234 tomcat7 on
echo "export CATALINA_HOME="/var/lib/tomcat7"" >> /etc/profile
source /etc/profile
cp -rv server.xml /var/lib/tomcat7/conf/server.xml
cp -rv spring-instrument-tomcat-4.0.2.RELEASE.jar /var/lib/tomcat7/lib/spring-instrument-tomcat-4.0.2.RELEASE.jar
#Reset the permission to unix user sduser
chown -Rf sduser.sduser /var/lib/tomcat7
chmod -R 775 /var/lib/tomcat7
rm -rf /var/lib/tomcat7/webapps/*
echo "Starting tomcat7 service"
service tomcat7 start
sleep 5;
echo "tomcat7 installation finished"
#Install memcached
yum --disablerepo="*" --enablerepo="smartdocs" install memcached -y
chkconfig memcached on
echo "Starting memcached service"
service memcached start
} | tee $LOG_FILE
echo ""
echo ""
#echo "Please check the log file $LOG_FILE for checking the memcached and tomcat7 installation status"
