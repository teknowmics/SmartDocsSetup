#Remove all data files
rm -rf /data/*

#Copy from backup to /data
rsync -avzh /backup/snapshots/daily.0/vg-data/lv-data/data/* /data/

rm -rf /data/db_data/ib_logfile0 /data/db_data/ib_logfile1

