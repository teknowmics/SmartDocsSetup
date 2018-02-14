#!/bin/bash
mkdir -p /root/SDInstallLogs/
LOG_FILE='/root/SDInstallLogs/verify-zookeeper-solr.log'
HOST_NAME=$(hostname -I)
        echo "" > $LOG_FILE
        echo "Checking zookeeper service"
ZK_PID=$(ps -fe | grep /opt/zookeeper-3.4.6/bin | grep -v grep | tr -s " "|cut -d" " -f2)

if [ "$ZK_PID" -ne 0 ] &>/dev/null

then

{
        echo "" >> $LOG_FILE
        echo "Zookeeper service is running with PID $ZK_PID" >> $LOG_FILE

        echo "" >> $LOG_FILE
}
else

{
        echo "" >> $LOG_FILE
        echo "Zookeeper service is not running on $HOST_NAME" >> $LOG_FILE
}

        fi

echo "Printing Zookeeper port listening status" >> $LOG_FILE
lsof -Pni :2181 >> $LOG_FILE
echo ""
echo ""

        echo "Checking Solr service"
SLR_PID=$(ps -fe | grep /opt/solr-5.2.1/server | grep -v grep | tr -s " "|cut -d" " -f2)
echo $SLR_PID
if [ "$SLR_PID" -ne 0 ] &>/dev/null

then

{
        echo "" >> $LOG_FILE
        echo "Solr service is running with PID $SLR_PID" >> $LOG_FILE
	echo "" >> $LOG_FILE
	echo "Checking default collection status"
	echo "Status of default collection is below" >> $LOG_FILE
	echo "" >> $LOG_FILE
/opt/solr-5.2.1/bin/solr healthcheck -c collection_sd_build -z localhost:2181 >> $LOG_FILE
        echo "" >> $LOG_FILE
}

else

{
        echo "" >> $LOG_FILE
        echo "Solr service is not running on $HOST_NAME" >> $LOG_FILE
}

        fi

echo "Printing Solr port listening status" >> $LOG_FILE
echo ""
echo ""
lsof -Pni :8983 >> $LOG_FILE
echo ""
echo ""


echo "Zookeeper and Solr install verification check is done. Please open the log file $LOG_FILE to see the status details"

