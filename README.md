# JenkinsMySqlBackupToAwsS3

Create backup of MySql db and store it in S3 with use of Jenkins job

1. Run containers:
```
docker-compose build
docker-compose up
```

2. Create database in db containers and example table
```
docker exec -it db bash
mysql -u root -h db_host -p
create database testdb;
use testdb;
create table info(name varchar(20), age int(2));
show tables;
desc info;  
insert into info values ('rafa', '30');
select * from info;
```

3. dump manually example data to a file from remote_host container
```
mysqldump -u root -h db_host -p testdb > /tmp/backup.sql
```

4. manually upload backup to s3 bucket 
- requires aws user with s3 permission and Access Key and Secret Access Key generated
```
export AWS_ACCESS_KEY_ID=your-value-for-your-user
export AWS_SECRET_ACCESS_KEY=your-value-for-your-user
aws s3 cp /tmp/backup.sql s3://jenkins-mysql-backup-example-123/backup.sql
```