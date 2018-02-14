#!/bin/bash
mkdir -p /etc/smartdocs
mkdir -p /var/log/smartDocs
chown -R tomcat7.tomcat7 /etc/smartdocs
chown -R tomcat7.tomcat7 /var/log/smartDocs
chown -R tomcat7.tomcat7 /var/www/smartdocs
echo "Starting memcache, tomcat7 and nginx services"
service memcached start; service tomcat7 start; service nginx start
echo "Flushing iptables rules"
iptables -F
service iptables save



