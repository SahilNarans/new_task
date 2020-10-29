#!/bin/bash

###Crontab will be run every 2 minute and find command will check if directory will be modify, so it will trigger mail.

abc=$(find LatestData -type d -mmin -2 -ls)
if [ -n "$abc" ]; then
  echo "Directory has been modified" | mail -s "Directory Updated" abc@xyz.com
fi

##ADD entry in crontab to run script daily, run below command, Added comment in cron commands

#crontab -e

##Add entry in crontab
## Crontab will run every 2 minutes
## Check logs in file, if you see any issue

#*/2 * * * * bash t3.sh >/var/logs/backup_logs/backup.log 2>&1
