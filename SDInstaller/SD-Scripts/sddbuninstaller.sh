#!/bin/bash
echo "Preparing uninstaller steps."
sleep 5;
mkdir -p /root/SDInstallLogs/
mysqlpass=$(cat /root/.mysql_secret)
LOG_FILE="/root/SDInstallLogs/sddbuninstaller.log"
touch $LOG_FILE                                                                                                                                                         
{                                                                                                                                                                       
exec 2>&1
read -r -p "Are You Sure that you want to run the Database uninstaller?. Please note that uninstaller will DELETE the SmartDocs database files from the system and Solr indexer files !!!!! [Y/n] " input
case $input in
    [yY][eE][sS]|[yY])
		echo "Yes"
echo "OK, Proceeding with Solr indexer files first"
mysql -uroot -p$mysqlpass -hlocalhost -N -e "select collection_name from sd_common_db.indexer_allocation where collection_name!='NULL';" > /tmp/solrcollections.txt
#ls /opt/solr-5.2.1/server/solr | grep collection_* | sed -e 's/\(_shard1_replica1\)*$//g' | grep -v collection_sd_build > /tmp/solrcollections.txt
for i in $(cat /tmp/solrcollections.txt)
do
echo "Deleting Solr collection $i"
curl "http://127.0.0.1:8983/solr/admin/collections?action=DELETE&name=$i&numShards=1&replicationFactor=1&maxShardsPerNode=1&collection.configName=smartdocs_configs"
echo "solr collection $i deleted"
done
echo ""
service solr stop
sleep 5;
service zookeeper stop;
echo "Reloading solr configurations"
sleep 10;
service zookeeper start
sleep 5;
/opt/solr-5.2.1/server/scripts/cloud-scripts/zkcli.sh -cmd upconfig -confdir /opt/solr-5.2.1/server/solr/configsets/smartdocs_configs/conf/ -confname smartdocs_configs -z 127.0.0.1:2181
sleep 5;
service solr start
slee 5;
echo "OK Proceeding with removal of SmartDocs database files"
echo "Preparing list of company databases"
mysql -uroot -p$mysqlpass -hlocalhost -N -e "select company_db_name from sd_common_db.company_host_mapping;" > /tmp/dblist.txt
echo "Going to drop the company databases"
for d in $(cat /tmp/dblist.txt)
do
mysql -uroot -p$mysqlpass -hlocalhost -N -e "drop database $i;"
done
echo "Going to drop smartdocs database users"
mysql -uroot -p$mysqlpass -hlocalhost -N -e "drop database sd_common_db;"
echo "Database drop is done"
echo ""
echo "Proceeding with smartdocs user deletion"
mysql -uroot -p$mysqlpass -hlocalhost -N -e "DELETE FROM mysql.USER where User='smartdocs';FLUSH PRIVILEGES;"
echo ""
echo ""
sleep 5;
echo "Database uninstallation is done!!!"
		;;
 
    [nN][oO]|[nN])
		echo ""
		echo "You chose No. Uninstaller will exit now!"
       		;;
 
    *)
	echo "Sorry,Invalid input provided. Uninstaller will exit now!"
	exit 1
	;;
esac
} | tee $LOG_FILE
echo ""
echo ""
echo "Please check the log file $LOG_FILE for checking the SmartDocs Web uninstaller status"
