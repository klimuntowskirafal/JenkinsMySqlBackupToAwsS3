#!/bin/bash

DATE=$(date +%H-%M-%S)
DB_HOST=$1
DB_PASSWD=$2
DB_NAME=$3

mysqldump -u root -h $DB_HOST -p$DB_PASSWD $DB_NAME > /tmp/backup-$DATE.sql