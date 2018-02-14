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
        echo "Script will exit here since hostname is not resolvable. Please re-run after setting resolvable hostname"
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
LOG_FILE="/root/SDInstallLogs/install-nginx.log"
touch $LOG_FILE
{
exec 2>&1
cd $INSTDIR/SD-BuildFiles
#install nginx Webserver
mkdir /etc/nginx
tar -xzf nginx-headers-module.tar.gz
mv -v nginx-headers-module /etc/nginx/headers-module
tar -xzf nginx-1.8.0.tar.gz
cd $INSTDIR/SD-BuildFiles/nginx-1.8.0
./configure --user=nginx --group=nginx --prefix=/etc/nginx --sbin-path=/usr/sbin/nginx --conf-path=/etc/nginx/nginx.conf --pid-path=/var/run/nginx.pid --lock-path=/var/run/nginx.lock --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --with-http_gzip_static_module --with-http_stub_status_module --with-http_ssl_module --with-pcre --with-file-aio --with-http_realip_module --without-http_scgi_module --without-http_uwsgi_module --without-http_fastcgi_module --add-module=/etc/nginx/headers-module
make
make install
useradd -r nginx
cd $INSTDIR/SD-BuildFiles
cp -rv nginx /etc/init.d/nginx
chmod +x /etc/init.d/nginx
chkconfig --add nginx
chkconfig --level 345 nginx on
mv -v /etc/nginx/nginx.conf /etc/nginx/nginx.conf-orig
cp -r nginx.conf /etc/nginx/nginx.conf
mkdir -p /etc/nginx/conf.d/
cp -r default.conf /etc/nginx/conf.d/default.conf
mkdir /etc/nginx/ssl
openssl req -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 -keyout /etc/nginx/ssl/example.com.key -out /etc/nginx/ssl/example.com.bundle.crt -subj "/C=IN/ST=Kerala/L=Cochin/O=IT Infra/CN=*.example.com"
cp -rv ssl.conf /etc/nginx/conf.d/ssl.conf
cd /etc/nginx/ssl/
openssl dhparam -out dhparam.pem 4096
mkdir -p /var/nginx/proxy_temp
mkdir -p /var/www/smartdocs/
mkdir -p /var/tmp/fupload
mkdir -p /var/localstorage/destfolder
chown -R sduser.sduser /var/tmp/fupload /var/localstorage/
chmod -R 775 /var/tmp/fupload /var/localstorage/
nginx -t
service nginx start
echo "Nginx installation finished"
} | tee $LOG_FILE
#echo "Please check the log file $LOG_FILE for checking the Nginx installation status"
