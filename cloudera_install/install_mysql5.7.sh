yum install wget
sudo yum install wget
wget https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm
sudo rpm -ivh mysql57-community-release-el7-9.noarch.rpm
yum update
sudo yum update
sudo yum install mysql-server
sudo systemctl start mysqld
sudo service mysqld stop
#find . -name my.cnf
#vi /etc/my.cnf
#cat /var/log/mysqld.log
sudo service mysqld start
sudo service mysqld status
#cat /var/log/mysqld.log
grep 'temporary password' /var/log/mysqld.log
mysql -u root -p
#show databases;
#SET Password=PASSWORD('<pwd>');

create database amon DEFAULT CHARACTER SET utf8;
grant all on amon.* TO 'amon'@'%' IDENTIFIED BY 'Cl0ud_password';

create database rman DEFAULT CHARACTER SET utf8;
grant all on rman.* TO 'rman'@'%' IDENTIFIED BY 'Cl0ud_password';

create database hive DEFAULT CHARACTER SET utf8;
grant all on hive.* TO 'hive'@'%' IDENTIFIED BY 'Cl0ud_password';

create database sentry DEFAULT CHARACTER SET utf8;
grant all on sentry.* TO 'sentry'@'%' IDENTIFIED BY 'Cl0ud_password';

create database cmdb DEFAULT CHARACTER SET utf8;
grant all on cmdb.* TO 'cmdb'@'%' IDENTIFIED BY 'Cl0ud_password';

create database oozie DEFAULT CHARACTER SET utf8;
grant all on oozie.* TO 'oozie'@'%' IDENTIFIED BY 'Cl0ud_password';
