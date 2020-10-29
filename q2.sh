#!/bin/bash
backup_dir=data1
time=$(date '+%Y-%m-%d')
zip -r backup_${time}.zip $backup_dir

###Upload backup file to S3 Bucket
aws s3 cp backup_${time}.zip s3://bucket-name/

##ADD entry in crontab to run script daily, run below command

#crontab -e

##Add entry in crontab
## Check logs in file, if you see any issue

#0 2 * * * bash abc1.sh >/var/logs/backup_logs/backup.log 2>&1
