# JenkinsMySqlBackupToAwsS3

Create backup of MySql db and store it in S3 with use of Jenkins job

Prerequisites:
- ssh keys generated and private key copied to container jenkins-aws:/tmp/remote-key
- aws user_id and secret_key adjusted

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

3. make a script executable which will allso alow jenkins to execute the script on the remote-host-aws container
```
chmod -x centos/script-mysql-backup.sh
```

4. in jenkins, add required in the script parameters, secrets, create a job and run it
- add this executable script to jenkins job:
```
bash /tmp/script-mysql-backup.sh $DB_HOST_PARAM $DB_PASSWD_PARAM $DB_NAME_PARAM $AWS_USER_ID_PARAM $AWS_USER_SECRET_PARAM $AWS_BUCKET_NAME_PARAM
```