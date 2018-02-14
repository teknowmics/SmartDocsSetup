#!/bin/bash
INSTDIR='/root/SDInstaller'
if [ ! -d "/root/SDInstaller" ]; then
echo "Installer directory SDInstaller is not found in location /root. Please copy the installer folder to /root and run the script again"
echo "Cannot proceed with installation. Script will exit here!!!"
exit 1
fi
mkdir -p /data/zookeeper_data
mkdir -p /root/SDInstallLogs/
LOG_FILE="/root/SDInstallLogs/install-zookeeper-solr.log"
touch $LOG_FILE
{
exec 2>&1
echo "Installing Zookeeper..."
#Add solr user to sduser group. This is needed when you use NAS as storage for SmartDocs data directory.
groupadd solr
useradd -s /bin/bash -g solr solr
usermod -g sduser solr
mkdir -p /opt
cd $INSTDIR/SD-BuildFiles
tar -zxf zookeeper-3.4.6.tar.gz
mv zookeeper-3.4.6 /opt/
cp -r /opt/zookeeper-3.4.6/conf/zoo_sample.cfg /opt/zookeeper-3.4.6/conf/zoo.cfg
sleep 10
cat > /opt/zookeeper-3.4.6/conf/zoo.cfg << EOL
tickTime=2000
dataDir=/data/zookeeper_data
clientPort=2181
initLimit=10
syncLimit=5
autopurge.snapRetainCount=3
autopurge.purgeInterval=1
EOL
#Zookeeper Log
sedvars3='ZOO_LOG_DIR="."'
sedvars4='ZOO_LOG_DIR="/opt/zookeeper-3.4.6/logs/"'
sed -i "s#$sedvars3#$sedvars4#" /opt/zookeeper-3.4.6/bin/zkEnv.sh
sleep 10
sedvars5='ZOO_LOG4J_PROP="INFO,CONSOLE"'
sedvars6='ZOO_LOG4J_PROP="INFO,CONSOLE,ROLLINGFILE"'
sed -i "s#$sedvars5#$sedvars6#" /opt/zookeeper-3.4.6/bin/zkEnv.sh
sleep 10
sedvars7='zookeeper.root.logger=INFO, CONSOLE'
sedvars8='zookeeper.root.logger=INFO, CONSOLE, ROLLINGFILE'
sed -i "s#$sedvars7#$sedvars8#" /opt/zookeeper-3.4.6/conf/log4j.properties
sleep 10
sedvars9='$ZOO_DATADIR/zookeeper_server.pid'
sedvars10='/tmp/zookeeper_server.pid'
sed -i "s#$sedvars9#$sedvars10#" /opt/zookeeper-3.4.6/bin/zkServer.sh
sleep 5
echo "log4j.appender.ROLLINGFILE.File.RotatePattern=yyyyMMdd'.log'" >> /opt/zookeeper-3.4.6/conf/log4j.properties
echo "log4j.appender.ROLLINGFILE=org.apache.log4j.DailyRollingFileAppender" >> /opt/zookeeper-3.4.6/conf/log4j.properties
echo "log4j.appender.ROLLINGFILE.datePattern='.'yyyy-MM-dd" >> /opt/zookeeper-3.4.6/conf/log4j.properties
cp -rv zookeeper /etc/init.d/zookeeper
chmod 755 /etc/init.d/zookeeper
chkconfig --add zookeeper
chkconfig --level 234 zookeeper on
echo "zookeeper installation finished.."
#Install Solr
echo "Installing Solr"
cd $INSTDIR/SD-BuildFiles
tar -xzf solr-5.2.1.tgz
mv solr-5.2.1 /opt/
mkdir -p /opt/solr-5.2.1/server/solr/configsets/smartdocs_configs
cp -r /opt/solr-5.2.1/server/solr/configsets/sample_techproducts_configs/* /opt/solr-5.2.1/server/solr/configsets/smartdocs_configs/
mv -v /opt/solr-5.2.1/server/solr/configsets/smartdocs_configs/conf/solrconfig.xml /opt/solr-5.2.1/server/solr/configsets/smartdocs_configs/conf/solrconfig-xml-orig
cp -rv solrconfig.xml /opt/solr-5.2.1/server/solr/configsets/smartdocs_configs/conf/solrconfig.xml
mv -v /opt/solr-5.2.1/server/solr/configsets/smartdocs_configs/conf/schema.xml /opt/solr-5.2.1/server/solr/configsets/smartdocs_configs/conf/schema-xml-orig
cp -rv schema.xml /opt/solr-5.2.1/server/solr/configsets/smartdocs_configs/conf/schema.xml
cp -rv solr /etc/init.d/solr
chmod 755 /etc/init.d/solr
echo "Changing Solr Heap size"
old='SOLR_HEAP="512m"'
new='SOLR_JAVA_MEM="-XX:PermSize256m -XX:MaxPermSize=512m -Xms2048m -Xmx2048m"'
sed -ie "s#$old#$new#g" /opt/solr-5.2.1/bin/solr.in.sh
echo "Solr Heap size changed"
echo ""
echo "Changing solr collection settings"
sed -i '85 i SOLR_HOME="/data/solr_data"' /opt/solr-5.2.1/bin/solr.in.sh
echo "Changing solr collection location to '/data/solr_data'"
mkdir -p /data/solr_data
mv -v /opt/solr-5.2.1/server/solr/* /data/solr_data
#Reset the zookeeper and solr data directory permission to sduser.
chown -R sduser.sduser /opt/solr-5.2.1/ /opt/zookeeper-3.4.6/ /data/zookeeper_data /data/solr_data
chmod -R 775 /opt/solr-5.2.1/ /opt/zookeeper-3.4.6/ /data/zookeeper_data /data/solr_data
#Starting zookeeper and solr instances
service zookeeper start
/opt/solr-5.2.1/server/scripts/cloud-scripts/zkcli.sh -cmd upconfig -confdir /data/solr_data/configsets/smartdocs_configs/conf/ -confname smartdocs_configs -z 127.0.0.1:2181
sleep 5;
service solr start
sleep 10;
echo "/opt/solr-5.2.1/server/scripts/cloud-scripts/zkcli.sh -cmd upconfig -confdir /data/solr_data/configsets/smartdocs_configs/conf/ -confname smartdocs_configs -z 127.0.0.1:2181" >> /etc/rc.local
echo "sleep 5;" >> /etc/rc.local
echo "service solr start" >> /etc/rc.local
curl 'http://127.0.0.1:8983/solr/admin/collections?action=CREATE&name=collection_sd_build&numShards=1&replicationFactor=1&maxShardsPerNode=1&collection.configName=smartdocs_configs'
echo ""
echo ""
echo "Solr installation finished"
} | tee $LOG_FILE
echo ""
echo ""
#echo "Please check the log file $LOG_FILE for checking the zookeeper and solr installation status"
