#!/bin/bash

DATE=$(date +%H-%M-%S)
DB_HOST=$1
DB_PASSWD=$2
DB_NAME=$3
AWS_USER_ID=$4
AWS_USER_SECRET=$5
BUCKET_NAME=$6

mysqldump -u root -h $DB_HOST -p$DB_PASSWD $DB_NAME > /tmp/backup-$DATE.sql && \
export AWS_ACCESS_KEY_ID=$AWS_USER_ID && \
export AWS_SECRET_ACCESS_KEY=$AWS_USER_SECRET && \
echo 'Uploading db backup on date $(date)'
aws s3 cp /tmp/backup-$DATE.sql s3://$BUCKET_NAME/backup-$DATE.sql